# CraveFood Open Source Projects
# ----------------------------------------
# requires packages_python
# requires nodeenv
# requires libssl-dev
nodeenv --node=10.0.0 node10
source ./node10/bin/activate
npm i -g yarn
sudo -H pip3 install pre-commit

git clone git@github.com:CraveFood/farmblocks.git
cd farmblocks
yarn install --ignore-engines
cd ~/


# CraveFood Proprietary Projects
# ----------------------------------------
# https://github.com/CraveFood/crave-tools
# https://github.com/CraveFood/hotsites/wiki
git clone git@github.com:CraveFood/crave-tools.git


git clone git@github.com:CraveFood/webapp.git
cd webapp
# node-sass requires node-gyp that requires gyp that uses Python 2
# there is a 2009's open issue for supporting Python 3
# at https://bugs.chromium.org/p/gyp/issues/detail?id=36
# meanwhile, it is unfortunate but we have to keep the
# Python 2 around, so....
sudo apt install python2.7 
npm install --python=python2.7
cd ~/

