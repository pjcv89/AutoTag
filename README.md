# Multi-label text classification with fastText and StarSpace

## Tutorial: Automatic Tag Generation for StackOverflow Questions

### By: Pablo Campos Viana

## Overview
This tutorial shows how to perform [multi-label](https://en.wikipedia.org/wiki/Multi-label_classification) text classification with two [Facebook AI Research](https://ai.facebook.com/)'s tools: [fastText](https://fasttext.cc/) and [StarSpace](https://research.fb.com/downloads/starspace/). We will use the [stacksample](https://www.kaggle.com/stackoverflow/stacksample) data to perform automatic tag generation. More precisely, given (short) text of questions titles, we want to predict their most probable tags. 

## Requirements

This tutorial assumes a standard installation of [miniconda](https://docs.conda.io/en/latest/miniconda.html) (based on Python 3.7) that is ready to use, running on a Linux system.

The following tools are required:

- [gcc](https://gcc.gnu.org/)
- g++
- [make](https://www.gnu.org/software/make/)
- [cmake](https://cmake.org/)
- unzip

Apart from the basic scientific stack (numpy, pandas, scikit-learn, matplotlib, and of course, [jupyter](https://pypi.org/project/jupyter/)) the following Python libraries are required (included in the `requirements.txt` file).
 
- [nltk](https://pypi.org/project/nltk/)
- [wordcloud](https://pypi.org/project/wordcloud/)
-  [Kaggle API](https://pypi.org/project/kaggle/)

## Usage 

**Docker users**: If you will be using the [Docker image](https://hub.docker.com/r/pjcv89/autotag), make sure you have [Docker](https://www.docker.com/get-started) installed in your machine and just run the following command in your terminal to pull and run the latest version of the image. 

```bash
docker run -p 8080:8888 pjcv89/autotag
```

If you have some experience with Docker, you may want to give a name to your container with the `--name` flag and use a volume with the `-v` flag to transfer data between your machine and the container. More specifically, you may want to choose some model and persist its model file so you can use it in another context (local mode or another container, for example, to use it in a web application). Once you have chosen a working directory in your machine, you can run the following command in your terminal.

```bash
docker run --name myautotag -p 8080:8888 -v $PWD/persist:/AutoTag/persist pjcv89/autotag
```

Once inside the container and once you have generated the models, you can copy a model file from the  `/models` folder to the `/persist` folder and it will be copied to your machine in the `$PWD/persist` folder.

In either case, a notebook instance will be launched and you can go to [http://localhost:8080/](http://localhost:8080/) to use it. You should copy the token displayed in the command line and paste it in the jupyter welcome page.

**Local-mode users**:  You will need to install the requirements by yourself.  You can follow the commands shown below in your terminal once you have chosen a working directory.

```bash
# Install tools
apt-get update && apt-get -y install gcc g++ make cmake unzip
# Clone this repo.
git clone https://github.com/pjcv89/AutoTag.git && cd AutoTag
# Install Python libraries
pip install -r requirements.txt

# Give execution permissions to installation scripts
chmod u+x install_fasttext.sh install_starspace.sh
# fastText CLI and Python API installation
./install_fasttext.sh
# StarSpace CLI installation
./install_starspace.sh
# Install jupyter if it isn't installed yet
pip install jupyter
# Launch notebook
jupyter notebook
```

## Files and folders

The following files are provided:

- ``requirements.txt``: Text file with the required Python libraries.
- ``install_starspace.sh``: The shell script to install StarSpace (CLI), based on its [documentation]([https://github.com/facebookresearch/StarSpace](https://github.com/facebookresearch/StarSpace)).
- ``install_fasttext.sh``: The shell script to install fastText (CLI and Python API) using **cmake**, based on its [documentation]([https://github.com/facebookresearch/fastText#building-fasttext-using-cmake](https://github.com/facebookresearch/fastText#building-fasttext-using-cmake)).
- ``Models.ipynb``: The development notebook used for this tutorial and required to reproduce the results.

After executing the installation scripts, the following folders will be present:
- */Starspace*: It contains the Starspace's source code.
- */fastText*: It contains the fastText's source code.

While running the notebook, the following folders will be created:
- */stacksample*: It contains the  ``Questions.csv`` and ``Tags.csv`` tables downloaded via the Kaggle API after executing the notebook.
- */data*: It contains the ``train``,``valid``, and ``test`` text files in the appropiate format required for both fastText and StarSpace. Also the ``train_weighted`` file to perform training with label weights with StarSpace. 
- */models*: It contains the fastText and StarSpace model files.
- */predictions*: It contains raw and processed text files with predictions for the test data, after inference with fastText and StarSpace.

Additionally, you will require to download a Kaggle token (a `kaggle.json` file containing your Kaggle API credentials, more info. [here](https://github.com/Kaggle/kaggle-api)) so you can copy and paste the credentials to declare environment variables inside the notebook and download the stacksample data.

## Structure of the notebook

The notebook is organized as follows.

1. Getting the data
2. Preparing the data
3. (Quick) Data exploration & visualization
4. Processing the data
5. Creating training, validation and test sets
6. Building the models
	1. fastText: baseline
	2. fastText: tuned model
	3. StarSpace: no label weights
	4. StarSpace: label weights
7. Model evaluation

Please note that the aim of this tutorial is to show how to use fastText and StarSpace, so you should focus on parts 6 and 7.

## Resources

- fastText related papers:

1. [Bag of Tricks for Efficient Text Classification](https://arxiv.org/abs/1607.01759)
2. [Enriching Word Vectors with Subword Information](https://arxiv.org/abs/1607.04606)
3. [FastText.zip: Compressing text classification models](https://arxiv.org/abs/1612.03651)
4. [Misspelling Oblivious Word Embeddings](https://arxiv.org/abs/1905.09755)

- Techniques used in fastText to improve scalability and training time:

1. [Hierarchical softmax based on the Huffman coding tree](https://arxiv.org/abs/1301.3781)
2. [The hashing trick](https://arxiv.org/abs/0902.2206)
3. [Hyperparameter autotuning for fastText](https://ai.facebook.com/blog/fasttext-blog-post-open-source-in-brief/)

- StarSpace paper:
1. [StarSpace: Embed All The Things!](https://arxiv.org/abs/1709.03856)
