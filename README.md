# Google Landmarks Dataset v2

This is the second version of the Google Landmarks dataset, which contains
images annotated with labels representing human-made and natural landmarks. The
dataset can be used for landmark recognition and retrieval experiments. This
version of the dataset contains approximately 5 million images, split into 3
sets of images: `train`, `index` and `test`.

This dataset is associated to two Kaggle challenges, on
[landmark recognition](https://kaggle.com/c/landmark-recognition-2019) and
[landmark retrieval](https://www.kaggle.com/c/landmark-retrieval-2019). Results
will be discussed as part of a
[CVPR'19 workshop](https://landmarksworkshop.github.io/CVPRW2019/). Please visit
the Kaggle challenge webpages for more detail on the data.

For reference, the previous version of the Google Landmarks dataset is available
[here](https://www.kaggle.com/google/google-landmarks-dataset).

## Download `train` set

### Download the labels and metadata

-   `train.csv`: CSV with id,url,landmark_id fields. `id` is a 16-character
    string, `url` is a string, `landmark_id` is an integer. Available at:
    [`https://s3.amazonaws.com/google-landmark/metadata/train.csv`](https://s3.amazonaws.com/google-landmark/metadata/train.csv).

-   `train_attribution.csv`: CSV with id,url,author,license,title fields. `id`
    is a 16-character string, and the other fields are strings of variable
    length. Available at:
    [`https://s3.amazonaws.com/google-landmark/metadata/train_attribution.csv`](https://s3.amazonaws.com/google-landmark/metadata/train_attribution.csv).

### Downloading the data

The `train` set is split into 500 TAR files (each of size ~1GB) containing
JPG-encoded images. The files are located in the `train/` directory, and are
named `images_000.tar`, `images_001.tar`, ..., `images_499.tar`. To download
them, access the following link:

[`https://s3.amazonaws.com/google-landmark/train/images_000.tar`](https://s3.amazonaws.com/google-landmark/train/images_000.tar)

And similarly for the other files.

### `train` image licenses

All images in the `train` set have CC-BY licenses without the NonDerivs (ND)
restriction. To verify the license for a particular image, please refer to
`train_attribution.csv`.

## Download `index` set

### Download the list of images

-   `index.csv`: single-column CSV with id field. `id` is a 16-character string.
    Available at:
    [`https://s3.amazonaws.com/google-landmark/metadata/index.csv`](https://s3.amazonaws.com/google-landmark/metadata/index.csv).

### Downloading the data

The `index` set is split into 100 TAR files (each of size ~850MB) containing
JPG-encoded images. The files are located in the `index/` directory, and are
named `images_000.tar`, `images_001.tar`, ..., `images_099.tar`. To download
them, access the following link:

[`https://s3.amazonaws.com/google-landmark/index/images_000.tar`](https://s3.amazonaws.com/google-landmark/index/images_000.tar)

And similarly for the other files.

### `index` image licenses

All images in the `index` set have CC-0 or Public Domain licenses.

## Download `test` set

### Download the list of images

-   `test.csv`: single-column CSV with id field. `id` is a 16-character string.
    Available at:
    [`https://s3.amazonaws.com/google-landmark/metadata/test.csv`](https://s3.amazonaws.com/google-landmark/metadata/test.csv).

### Downloading the data

The `test` set is split into 20 TAR files (each of size ~500MB) containing
JPG-encoded images. The files are located in the `test/` directory, and are
named `images_000.tar`, `images_001.tar`, ..., `images_019.tar`. To download
them, access the following link:

[`https://s3.amazonaws.com/google-landmark/test/images_000.tar`](https://s3.amazonaws.com/google-landmark/test/images_000.tar)

And similarly for the other files.

### `test` image licenses

All images in the `test` set have CC-0 or Public Domain licenses.

## Checking the download

We also make available md5sum files for checking the integrity of the downloaded
files. Each md5sum file corresponds to one of the TAR files mentioned above;
they are located in the `md5sum/index/`, `md5sum/test/` and `md5sum/train/`
directories, with file names `md5.images_000.txt`, `md5.images_001.txt`, etc.
For example, the md5sum file corresponding to the `images_000.tar` file in the
`index` set can be found via the following link:

[`https://s3.amazonaws.com/google-landmark/md5sum/index/md5.images_000.txt`](https://s3.amazonaws.com/google-landmark/md5sum/index/md5.images_000.txt)

And similarly for the other files.

## Extracting the data

We recommend that the set of TAR files corresponding to each dataset split be
extracted into a directory per split; ie, the `index` TARs extracted into an
`index` directory; `train` TARs extracted into a `train` directory; etc. The
directory structure of the image data is as follows: Each image is stored in a
directory `${a}`/`${b}`/`${c}`/`${id}`.jpg, where `${a}`, `${b}` and `${c}` are
the first three letters of the image id, and `${id}` is the image id found in
train.csv. For example, an image with the id `0123456789abcdef` would be stored
in `0/1/2/0123456789abcdef.jpg`.

## Dataset licenses

The annotations are licensed by Google under CC BY 4.0 license. The images
listed in this dataset are publicly available on the web, and may have different
licenses. Google does not own their copyright. Note: while we tried to identify
images that are licensed under a Creative Commons Attribution license, we make
no representations or warranties regarding the license status of each image and
you should verify the license for each image yourself.
