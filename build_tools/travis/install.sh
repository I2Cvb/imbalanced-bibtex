# Deactivate the travis-provided virtual environment and setup a
# conda-based environment instead
deactivate

# Use the miniconda installer for faster download / install of conda
# itself
pushd .
cd
mkdir -p download
cd download
echo "Cached in $HOME/download :"
ls -l
echo
if [[ ! -f miniconda.sh ]]
   then
   wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh \
        -O miniconda.sh
   fi
chmod +x miniconda.sh && ./miniconda.sh -b
cd ..
export PATH=/home/travis/miniconda2/bin:$PATH
conda update --yes conda
popd

# Configure the conda environment and put it in the path using the
# provided versions
conda create -n testenv --yes python=$PYTHON_VERSION pip nose \
      numpy=$NUMPY_VERSION scipy=$SCIPY_VERSION \
        libgfortran nomkl
source activate testenv

# Install python-bibtexparser
git clone "https://github.com/sciunto-org/python-bibtexparser.git"
cd python-bibtexparser
python setup.py install

cd $TRAVIS_BUILD_DIR
