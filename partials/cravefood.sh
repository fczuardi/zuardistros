# CraveFood Open Source Projects
# ----------------------------------------
# requires packages_python
# requires nodeenv
nodeenv --node=10.0.0 node10
source ./node10/bin/activate
npm i -g yarn

git clone git@github.com:CraveFood/farmblocks.git
cd farmblocks
yarn install --ignore-engines
cd ~/


# CraveFood Proprietary Projects
# ----------------------------------------
git clone git@github.com:CraveFood/webapp.git
cd webapp
npm install
cd ~/

