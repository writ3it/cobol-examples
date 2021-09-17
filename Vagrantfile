Vagrant.configure("2") do |config|
    config.vm.define "mariadb" do |mariadb|
        mariadb.vm.box = "generic/debian10"
        mariadb.vm.hostname = 'mariadb.local'
        mariadb.vm.network "private_network", ip: "10.0.1.2"
        mariadb.vm.network "forwarded_port", guest: 3306, host: 3306

        mariadb.vm.provision :file do |file|
            file.source = "examples/gnucobol/database/mariadb/init.sql"
            file.destination = "/tmp/init.sql"
        end

        mariadb.vm.provision "shell", inline: <<-SHELL
            sudo apt-get update
            sudo apt-get -y install gnupg mariadb-server

            sudo mysql -e "CREATE DATABASE coboldb;"
            
            sudo mysql coboldb< /tmp/init.sql

            sudo sed -i 's/bind-address            = 127\.0\.0\.1/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

            sudo service mariadb restart
        SHELL
    end

    config.vm.define "mainframe" do |mainframe|
        mainframe.vm.synced_folder "examples", "/home/vagrant/examples/"
        mainframe.vm.synced_folder "Mainframe/Printers", "/home/vagrant/Printers/"
        mainframe.vm.synced_folder "bin", "/home/vagrant/bin/"
        mainframe.vm.box = "generic/debian10"
        mainframe.vm.hostname = 'mainframe.local'
        mainframe.vm.network "private_network", ip: "10.0.1.4"
        mainframe.vm.network "forwarded_port", guest: 3270, host: 3270

        mainframe.vm.provision "shell", inline: <<-SHELL
            # hercules emulator and terminal
            sudo apt-get -y install hercules x3270 c3270 unzip
            

            # hercules os (MVS turnkey)
            wget http://wotho.ethz.ch/tk4-/tk4-_v1.00_current.zip
            mkdir mvs
            cd mvs 
            unzip ../tk4-_v1.00_current.zip
            cd ..
            rm tk4-_v1.00_current.zip
            sudo chown -R vagrant:vagrant mvs
            chmod +x mvs/mvs

            echo "NUMCPU 2" >> mvs/local_conf/01

            remotePrintersDir=`cat /proc/mounts | grep /home/vagrant/Printers | cut -f1 -d' '`
            remotePrintersMethod=`cat /proc/mounts | grep /home/vagrant/Printers | cut -f3 -d' '`
            remotePrintersOptions=`cat /proc/mounts | grep /home/vagrant/Printers | cut -f4 -d' '`
            sudo mount -t $remotePrintersMethod -o $remotePrintersOptions $remotePrintersDir /home/vagrant/mvs/prt
            chown vagrant:vagrant mvs/prt
        SHELL
        mainframe.vm.provision "shell",run: 'always',inline: <<-SHELL
            cd mvs
            su - vagrant
            ./mvs &
        SHELL
    end

    config.vm.define "cobol" do |cobol|
        cobol.vm.synced_folder "examples", "/home/vagrant/examples/"
        cobol.vm.synced_folder "CopyBooks", "/home/vagrant/CopyBooks/"
        cobol.vm.synced_folder "SampleData", "/home/vagrant/SampleData/"
        cobol.vm.synced_folder "bin", "/home/vagrant/bin/"
        cobol.vm.box = "generic/debian10"
        cobol.vm.hostname = 'cobol.local'
        cobol.vm.network "private_network", ip: "10.0.1.3"

      

        cobol.vm.provision "shell", inline: <<-SHELL
            sudo apt-get update
            
            # gnuCobol
            sudo apt-get -y install open-cobol gnucobol g++ unixodbc unixodbc-dev odbcinst git cmake make gcc libssl-dev 

            # mariadb odbc
            git clone https://github.com/MariaDB/mariadb-connector-odbc.git
            cd mariadb-connector-odbc
            cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCONC_WITH_UNIT_TESTS=Off -DCONC_WITH_MSI=OFF -DCMAKE_INSTALL_PREFIX=/usr/local .
            cmake --build . --config RelWithDebInfo
            sudo make install
            cd ..
            rm -rf mariadb-connector-odbc

            # register mariadb odbc driver
            sudo odbcinst -i -d -f examples/database/mariadb/mariadb_driver_template.ini
            
            # esqlOC
            wget http://www.kiska.net/opencobol/esql/gnu-cobol-sql-2.0.tar.gz
            tar xvf gnu-cobol-sql-2.0.tar.gz
            cd gnu-cobol-sql-2.0
            ./configure
            make
            sudo make install
            sudo ldconfig
            cd ..
            rm -rf gnu-cobol-sql-2.0
            rm gnu-cobol-sql-2.0.tar.gz

            # permission
            chmod +x bin/*

            # c3270
            sudo apt-get -y install c3270 x3270 s3270
            echo "alias mf-term='c3270 -model 4 10.0.1.4 3270'" >> .bashrc
        SHELL
    end
end