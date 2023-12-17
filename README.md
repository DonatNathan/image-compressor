# Image Compressor

## Description 

Second year Epitech project.\
Do not copy this project if you are an Epitech student !\
The goal of this project is to implement the k-means algorythm in Haskell language

## Grades 

### Module 

Module Name | Grade
----------- | -----
B4 - Functional programming | B

### Project

#### Global

Project Name | Final Mark | Automated tests percentage
------------ | ---------- | --------------------------
Image Compressor | 19 | 100%

#### Codding Style

Fatal | Major | Minor | Info
----- | ----- | ----- | ----
0 | 0 | 1 | 1

#### Coverage

Branches | Lines
-------- | -----
0% | 0%

#### Automated tests

##### Total: 48/48
> 00 - 1 cluster: 4/4\
> 01 - 2 clusters: 22/22\
> 02 - 3 clusters: 7/7\
> 03 - 4 clusters: 6/6\
> 04 - 5 clusters: 4/4\
> 05 - 16 clusters: 1/1\
> 06 - Error handling: 4/4

### Proof

![image](https://github.com/DonatNathan/image-compressor/assets/91681379/de6bec25-bdbd-4469-8f28-a319492b18ee)

## Notes

Very good project !

## How to compile

```
make
```

## How to run

```
./convertImg <P> > imagePixels.txt
./imageCompressor -n <N> -l <L> -f imagePixels.txt > newImagePixels.txt
./xpmImg newImagePixels.txt > compressedImage.jpg
```

### Arguments

Name | Signification
--------------------
N    | Number of colors
L    | Convergence limit (0 < L > 1)
P    | Path to image to compress
