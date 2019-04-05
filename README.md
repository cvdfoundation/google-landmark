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

Currently, only the `train` dataset is available. The `index` and `test` sets
will be released with the second stage of the Kaggle challenges.

For reference, the previous version of the Google Landmarks dataset is available
[here](https://www.kaggle.com/google/google-landmarks-dataset).

## Download `train` set

### Download the labels and metadata

-   `train.csv`: CSV with id,url,landmark_id fields. `id` is a 16-character
    string, `url` is a string, `landmark_id` is an integer. Available at:
    `https://s3.amazonaws.com/google-landmark/metadata/train.csv`.

-   `train_attribution.csv`: CSV with id,url,author,license,title fields. `id`
    is a 16-character string, and the other fields are strings of variable
    length. Available at:
    `https://s3.amazonaws.com/google-landmark/metadata/train_attribution.csv`.

### Downloading the data

The `train` set is split into 500 TAR files containing JPG-encoded images. The
files are located in the `train/` directory, and are named `images_000.tar`,
`images_001.tar`, ..., `images_499.tar`. To download them, access the following
link:

`https://s3.amazonaws.com/google-landmark/train/images_000.tar`

And similarly for the other files.

### Checking the download

We also make available md5sum files for checking the integrity of the downloaded
files. Each md5sum file corresponds to one of the TAR files mentioned above;
they are located in the `md5sum/train/` directory, with file names
`md5.images_000.txt`, `md5.images_001.txt`, `md5.images_499.txt`. For example,
the md5sum file corresponding to the `images_000.tar` file can be found via the
following link:

`https://s3.amazonaws.com/google-landmark/md5sum/train/md5.images_000.txt`

And similarly for the other files.
