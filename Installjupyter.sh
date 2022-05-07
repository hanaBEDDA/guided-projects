#!/bin/bash

cd /home/rhyme/Desktop
wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
chmod +x Anaconda3-2019.10-Linux-x86_64.sh
./Anaconda3-2019.10-Linux-x86_64.sh -b #download and install anaconda/jupyter

#install packages via conda/pip (optional)
/home/rhyme/anaconda3/bin/conda install -y numpy pandas matplotlib scikit-learn -c anaconda
/home/rhyme/anaconda3/bin/pip install numpy pandas matplotlib scikit-learn
#/home/rhyme/anaconda3/bin/pip install -q tensorflow-gpu==2.0.0-beta1
#/home/rhyme/anaconda3/bin/conda install -y cudatoolkit=10.1
#/home/rhyme/anaconda3/bin/jt -t grade3 -N -T #install theme (optional)

mkdir /home/rhyme/Desktop/Project #Jupyter server will launch here


#create Jupyter service (file on my github repo)
/home/rhyme/anaconda3/bin/jupyter notebook --generate-config
wget https://github.com/snehankekre/Misc/raw/master/jupyter.service
sudo mv jupyter.service /etc/systemd/system/
/home/rhyme/anaconda3/bin/jupyter notebook password #set Jupyter password (anything). You can log in after setup using the password. Learner will not have to once you do it.

sudo systemctl enable jupyter.service
sudo systemctl daemon-reload
sudo systemctl restart jupyter.service

#get firefox to launch http://localhost:8888/ on startup. Inspect file if you want to modify it
wget https://github.com/snehankekre/Misc/raw/master/firefox_autostart.desktop
mkdir /home/rhyme/.config/autostart/
sudo mv firefox_autostart.desktop /home/rhyme/.config/autostart/ #move to the autostart folder

rm -rf Anaconda3-2019.10-Linux-x86_64.sh

echo "Please, reboot your Cloud Desktop to auto launch Jupyter Notebooks"
