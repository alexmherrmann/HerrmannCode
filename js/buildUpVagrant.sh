#
# Here we build up our vagrant box with everything that we'll need
#


echo "Building up dude!"

BASE_PATH=${HOME}/app
BP=$BASE_PATH # Because I'm lazy
mkdir $BASE_PATH

NODE_PATH=$BP/node
D_PATH=$BP/d

function setUp
{
  REQUIRED_PACKAGES=(build-essential make libssl-dev python g++)
  echo "setting up"

  for X in $REQUIRED_PACKAGES; do
    apt-get install -y $X
  done

  echo "finished setting up"
}

function installJS
{
  echo "Installing the Java script tools necessary"

  NODE_URL="http://nodejs.org/dist/v0.12.2/node-v0.12.2.tar.gz"
  (
    mkdir $NODE_PATH
    cd $NODE_PATH
    wget $NODE_URL
    tar xf *.tar.gz # We don't care what it's called
    cd node* # probably not the safest, but that's okay

    ./configure
    make -j 2
    make install

    npm install -g ember-cli
  )
}

function installD
{
  echo "Installing D and related tools"

  D_URL="http://downloads.dlang.org/releases/2.x/2.067.1/dmd_2.067.1-0_amd64.deb"
  DUB_URL="https://github.com/D-Programming-Language/dub/archive/v0.9.23.tar.gz"
  (
    mkdir $D_PATH
    cd $D_PATH
    wget $D_URL
    dpkg -i *.deb

    curl $DUB_URL > dub.tar.gz
    (
      mkdir temp
      cd temp
      tar xf ../dub.tar.gz
      cd *
      ./build.sh
      cp bin/sub /usr/local/bin

    )
  )

}

function makeCopy
{
  cp -r /vagrant/gcl $BP/gcl
}


setUp
installJS
installD

# Now we build up and start our emberJS application
