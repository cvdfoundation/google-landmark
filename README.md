# Google Landmarks Dataset v2

This is the second version of the Google Landmarks dataset (GLD-v2), which
contains images annotated with labels representing human-made and natural
landmarks. The dataset can be used for landmark recognition and retrieval
experiments. This version of the dataset contains approximately 5 million
images, split into 3 sets of images: `train`, `index` and `test`. The dataset
was presented in our
[Google AI blog post](https://ai.googleblog.com/2019/05/announcing-google-landmarks-v2-improved.html).
In this repository, we present download links for all dataset files and relevant
code for metric computation.

This dataset was associated to two Kaggle challenges, on
[landmark recognition](https://kaggle.com/c/landmark-recognition-2019) and
[landmark retrieval](https://www.kaggle.com/c/landmark-retrieval-2019). Results
were discussed as part of a
[CVPR'19 workshop](https://landmarksworkshop.github.io/CVPRW2019/). In this
repository, we also provide scores for the top 10 teams in the challenges, based
on the latest ground-truth version. Please visit the challenge and workshop
webpages for more details on the data, tasks and technical solutions from top
teams.

For reference, the previous version of the Google Landmarks dataset (referred to
as Google Landmarks dataset v1, GLD-v1) is available
[here](https://www.kaggle.com/google/google-landmarks-dataset).

## Current version

The current dataset version is **2.1**. See the
[release history](#release-history) for details, including re-scored challenge
submissions based on the latest ground-truth version.

## Download `train` set

There are 4,132,914 images in the `train` set.

### Download the labels and metadata

-   `train.csv`: CSV with id,url,landmark_id fields. `id` is a 16-character
    string, `url` is a string, `landmark_id` is an integer. Available at:
    [`https://s3.amazonaws.com/google-landmark/metadata/train.csv`](https://s3.amazonaws.com/google-landmark/metadata/train.csv).

-   `train_attribution.csv`: CSV with id,url,author,license,title fields. `id`
    is a 16-character string, and the other fields are strings of variable
    length. Available at:
    [`https://s3.amazonaws.com/google-landmark/metadata/train_attribution.csv`](https://s3.amazonaws.com/google-landmark/metadata/train_attribution.csv).

-   `train_label_to_category.csv`: CSV with landmark_id,category fields:
    `landmark_id` is an integer, `category` is a Wikimedia URL referring to the
    class definition. Available at:
    [`https://s3.amazonaws.com/google-landmark/metadata/train_label_to_category.csv`](https://s3.amazonaws.com/google-landmark/metadata/train_label_to_category.csv).

### Downloading the data

The `train` set is split into 500 TAR files (each of size ~1GB) containing
JPG-encoded images. The files are located in the `train/` directory, and are
named `images_000.tar`, `images_001.tar`, ..., `images_499.tar`. To download
them, access the following link:

[`https://s3.amazonaws.com/google-landmark/train/images_000.tar`](https://s3.amazonaws.com/google-landmark/train/images_000.tar)

And similarly for the other files.

#### Using the provided script

```bash
mkdir train && cd train
bash ../download-dataset.sh train 499
```

This will automatically download, verify and extract the images to the `train`
directory.

Note: This script downloads files in parallel. To adjust the number of parallel
downloads, modify `NUM_PROC` in the script.

### `train` image licenses

All images in the `train` set have CC-BY licenses without the NonDerivs (ND)
restriction. To verify the license for a particular image, please refer to
`train_attribution.csv`.

## Download `index` set

There are 761,757 images in the `index` set.

### Download the list of images and metadata

**IMPORTANT**: Note that the integer landmark id's mentioned here are different
from the ones in the train set above.

-   `index.csv`: single-column CSV with id field. `id` is a 16-character string.
    Available at:
    [`https://s3.amazonaws.com/google-landmark/metadata/index.csv`](https://s3.amazonaws.com/google-landmark/metadata/index.csv).

-   `index_image_to_landmark.csv`: CSV with id,landmark_id fields: `id` is a
    16-character string, `landmark_id` is an integer. Available at:
    [`https://s3.amazonaws.com/google-landmark/metadata/index_image_to_landmark.csv`](https://s3.amazonaws.com/google-landmark/metadata/index_image_to_landmark.csv).

-   `index_label_to_category.csv`: CSV with landmark_id,category fields:
    `landmark_id` is an integer, `category` is a Wikimedia URL referring to the
    class definition. Available at:
    [`https://s3.amazonaws.com/google-landmark/metadata/index_label_to_category.csv`](https://s3.amazonaws.com/google-landmark/metadata/index_label_to_category.csv).

### Downloading the data

The `index` set is split into 100 TAR files (each of size ~850MB) containing
JPG-encoded images. The files are located in the `index/` directory, and are
named `images_000.tar`, `images_001.tar`, ..., `images_099.tar`. To download
them, access the following link:

[`https://s3.amazonaws.com/google-landmark/index/images_000.tar`](https://s3.amazonaws.com/google-landmark/index/images_000.tar)

And similarly for the other files.

#### Using the provided script

```bash
mkdir index && cd index
bash ../download-dataset.sh index 99
```

This will automatically download, verify and extract the images to the `index`
directory.

Note: This script downloads files in parallel. To adjust the number of parallel
downloads, modify `NUM_PROC` in the script.

### `index` image licenses

All images in the `index` set have CC-0 or Public Domain licenses.

## Download `test` set

There are 117,577 images in the `test` set.

### Download the list of images and ground-truth

-   `test.csv`: single-column CSV with id field. `id` is a 16-character string.
    Available at:
    [`https://s3.amazonaws.com/google-landmark/metadata/test.csv`](https://s3.amazonaws.com/google-landmark/metadata/test.csv).

-   `recognition_solution_v2.1.csv`: CSV with three columns: `id` (16-character
    string), `landmarks` (space-separated list of integer landmark IDs, or empty
    if no landmark from the dataset is depicted), `Usage` (either "Public" or
    "Private", referring to which subset the image belongs to). Available at:
    [`https://s3.amazonaws.com/google-landmark/ground_truth/recognition_solution_v2.1.csv`](https://s3.amazonaws.com/google-landmark/ground_truth/recognition_solution_v2.1.csv).

-   `retrieval_solution_v2.1.csv`: CSV with three columns: `id` (16-character
    string), `images` (space-separated list of string index image IDs, or None
    if this image is ignored), `Usage` (either "Public" or "Private", referring
    to which subset the image belongs to). Available at:
    [`https://s3.amazonaws.com/google-landmark/ground_truth/retrieval_solution_v2.1.csv`](https://s3.amazonaws.com/google-landmark/ground_truth/retrieval_solution_v2.1.csv).

### Downloading the data

The `test` set is split into 20 TAR files (each of size ~500MB) containing
JPG-encoded images. The files are located in the `test/` directory, and are
named `images_000.tar`, `images_001.tar`, ..., `images_019.tar`. To download
them, access the following link:

[`https://s3.amazonaws.com/google-landmark/test/images_000.tar`](https://s3.amazonaws.com/google-landmark/test/images_000.tar)

And similarly for the other files.

#### Using the provided script

```bash
mkdir test && cd test
bash ../download-dataset.sh test 19
```

This will automatically download, verify and extract the images to the `test`
directory.

Note: This script downloads files in parallel. To adjust the number of parallel
downloads, modify `NUM_PROC` in the script.

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

If you use the provided `download-dataset.sh` script, the integrity of the files
is already checked right after download.

## Extracting the data

We recommend that the set of TAR files corresponding to each dataset split be
extracted into a directory per split; ie, the `index` TARs extracted into an
`index` directory; `train` TARs extracted into a `train` directory; etc. The
directory structure of the image data is as follows: Each image is stored in a
directory `${a}`/`${b}`/`${c}`/`${id}`.jpg, where `${a}`, `${b}` and `${c}` are
the first three letters of the image id, and `${id}` is the image id found in
train.csv. For example, an image with the id `0123456789abcdef` would be stored
in `0/1/2/0123456789abcdef.jpg`.

## Metric computation code

The metric computation scripts have been made available, via the
[DELF github repository](https://github.com/tensorflow/models/tree/master/research/delf/delf/python/google_landmarks_dataset),
see the python scripts `compute_recognition_metrics.py` and
`compute_retrieval_metrics.py`. These scripts accept as input the ground-truth
files, along with predictions in the format submitted to Kaggle.

## Dataset licenses

The annotations are licensed by Google under CC BY 4.0 license. The images
listed in this dataset are publicly available on the web, and may have different
licenses. Google does not own their copyright. Note: while we tried to identify
images that are licensed under a Creative Commons Attribution license, we make
no representations or warranties regarding the license status of each image and
you should verify the license for each image yourself.

## Release history

### Sept 2019 (version 2.1)

Ground-truth and labelmaps released. Note that the ground-truth has been
substantially updated since the end of the 2019 Kaggle challenges; it is not the
one that was used for scoring in the challenge.

We have re-computed metrics for the top 10 teams in the 2019 challenges (see the
Kaggle challenge webpages for precise definitions of the metrics):

#### Recognition metrics

Team                     | Private GAP (%) | Public GAP (%)
:----------------------: | :-------------: | :------------:
JL                       | 66.53           | 61.86
GLRunner                 | 53.08           | 52.07
smlyaka                  | **69.39**       | **65.85**
Chundi Liu               | 60.86           | 56.77
Cookpad                  | 33.66           | 31.12
bestfitting              | 54.53           | 52.46
Himanshu Rai             | 60.32           | 56.28
Eduardo                  | 46.88           | 44.07
ods.ai                   | 24.02           | 22.28
ZFTurbo & Weimin & David | 38.99           | 39.83

#### Retrieval metrics

Team                           | Private mAP@100 (%) | Public mAP@100 (%)
:----------------------------: | :-----------------: | :----------------:
smlyaka                        | **37.14**           | **35.63**
imagesearch                    | 34.38               | 32.04
Layer 6 AI                     | 32.10               | 29.92
bestfitting                    | 32.12               | 29.09
ods.ai                         | 29.82               | 27.82
learner                        | 28.98               | 27.33
CVSSP                          | 28.07               | 26.59
Clova Vision, NAVER/LINE Corp. | 27.77               | 25.85
VRG Prague                     | 25.48               | 23.71
JL                             | 24.98               | 22.73

### May 2019 (version 2.0)

Included data for `test` and `index` sets.

### Apr 2019 (version 2.0)

Initial version, including only `train` set.

## Contact

For any questions/suggestions/comments/corrections, please open an issue in this
github repository. In particular, we plan to maintain and release new versions
of the ground-truth as corrections are found.

## Dataset Metadata
The following table is necessary for this dataset to be indexed by search
engines such as <a href="https://g.co/datasetsearch">Google Dataset Search</a>.
<div itemscope itemtype="http://schema.org/Dataset">
  <table>
    <tr>
      <th>property</th>
      <th>value</th>
    </tr>
    <tr>
      <td>name</td>
      <td><code itemprop="name">Google Landmarks Dahttps://avatars1.githubusercontent.com/u/1870149?s=40&v=4taset v2</code></td>
    </tr>
    <tr>
      <td>alternateName</td>
      <td><code itemprop="name">Learning to Detect Manipulated Facial Images</code></td>
    </tr>
    <tr>
      <td>description</td>
      <td><code itemprop="description">FaceForensics++ is a forensics dataset consisting of 1000 original video sequences that have been manipulated with four automated face manipulation methods: Deepfakes, Face2Face, FaceSwap and NeuralTextures. The data has been sourced from 977 youtube videos and all videos contain a trackable mostly frontal face without occlusions which enables automated tampering methods to generate realistic forgeries. As we provide binary masks the data can be used for image and video classification as well as segmentation. In addition, we provide 1000 Deepfakes models to generate and augment new data.

For more information, please consult our <a href="https://arxiv.org/abs/1901.08971">updated paper</a>.</code></td>
    </tr>
    <tr>
      <td>sameAs</td>
      <td><code itemprop="sameAs">https://github.com/ondyari/FaceForensics/</code></td>
    </tr>
    <tr>
      <td>provider</td>
      <td>
        <div itemscope itemtype="http://schema.org/Organization" itemprop="provider">
          <table>
            <tr>
              <th>property</th>
              <th>value</th>
            </tr>
            <tr>
              <td>name</td>
              <td><code itemprop="name">Google</code></td>
            </tr>
            <tr>
              <td>sameAs</td>
              <td><code itemprop="sameAs">https://en.wikipedia.org/wiki/Google</code></td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
    <tr>
      <td>citation</td>
      <td><code itemprop="citation">https://arxiv.org/abs/1901.08971</code></td>
    </tr>
    <tr>
      <td>license</td>
      <td><code itemprop="license">The data is released under the <a href="http://kaldir.vc.in.tum.de/faceforensics_tos.pdf">FaceForensics Terms of Use</a></code></td>
    </tr>
  </table>
</div>
