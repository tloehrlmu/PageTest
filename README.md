# 🧰 Toolbox for Uncertainty Quantification in <br> Machine Learning and Artificial Intelligence

## Requirements 
Please see a detailed package list in the `requirements.txt`. 
```
pip install -r requirements.txt
```

## How to just build locally without pushing to public?
Run the following command on your local branch !!**not main**!!.
```
bash build.zsh
```
Alternatively:
```
jupyter-book clean .
jupyter-book build .
```
<span style="color: red">
General remark: It is important to run this with the activated python environment you use to program the notebooks.</span>

## How to view locally the website?
Please open/copy the link line after `build/htmtl/index.html` in the terminal from your favorite browser.

## How to build a new page and push to public with GiHub Workflow?
run the following commands in the terminal:
```
chmod +x build.zsh
./build.zsh
``` 

The changes will only be made public if *build.zsh* is called in the git *main* branch. 

### Technical explanation what is happening:
The script runs 
``` 
jupyter-book clean .
jupyter-book build .
```
to build the book. Then the command ```ghp-import -n -p -f _build/html``` is executed.
This will push the entire html files in *_build/html* to the *gh-pages* branch and GitHub will update the webpage based on that branch. \
But this commands **deletes** everything that has prior been on the *gh-pages* branch. \
That is the reason why I have written the *build.zsh* to only run the command when on the main branch.
So our goal is to always have the desired content we want online, to be on the main branch.

<span style="color: red">
General remark: It is important to run this with the activated python enviroment you use to program the notebooks.</span>

## How to organize Chapters?
1. First a general explanation how jupyter-book works. The `_toc.yml` file is the organizer keeping everything at bay and defining the structure.
1. If we want to add a new chapter page, we simply add * - file <path/filename> * to the end of the file (where the other -file commands are). 
1. To have supchapters it is important to now that `#` are seen as big page titles whereas `##` are the "true" supchapters of a page. 

Thus when adding content we have the two options:
### Option 1: Use mutliple files
First put everthing nice and tight into a folder *<folder>*. \
Then create some kind of <mainPage> (markdown or jupyterNotebook does not really matter. I recommend jupyterNoteBook) for the chapter (probably explaining math stuff). \
Then create additionally files (probably jupyterBooks but really is not important) and add your content there.\
Then you have to add the following to the _toc.yml file:
```
- file: <folder>/<mainPage>
  sections:
  - file: <folder>/<subPage1>
  - file: <folder>/<subPage2>
    ....
```
It is important to notice that the creation of the page is top to bottom.
Thus all chapters of <mainPage> are structured before the chapters of subPages ( the natural way when you think about it).

### Option 2: Use one file (not recommended I think)
Just write one big juypter file and structure the chapters with `#` indicating the main page name. `##` and `###`for the supchapters.

## What are uniform styles for the documentation?

We use one `#` **once** for the main title of each chapter. 
For additional subtitles, we add one more `#` then (i.e., `##` and `###`, better no `####` for simplicity). 

Note that we do **not** add `#` for the content in each Markdown cell, 
which means, we create pure `latex-like` texts which align with the survey paper. 
For a better view and alignment, we add the following in each contextual `Markdown cell`:

```
<div align="justify">

</div>
```

We add an extra `sub-chapter` (another `.ipynb` file) in chapter folders for additional information or examples.

Import packages in the first code cell on the page at the top.

For code cells, if we use any python packages, 
please make sure:
1. They are in the `requirements.txt`. If not, please add them.
1. import them (e.g., `import numpy as np`).

For those originally appear in Latex `.tex` format, 
we replace them into the Markdown format (See examples as below).

| Latex            | Markdown            |
|:----------------:|:-------------------:|
| \emph{text}      | \*text\*    |
| ``text''         | "text" |
| \given           | \vert  |
| \citep{gnei_sp05}| ({cite:t}\`gnei_sp05\`)  |
| \citet{gnei_sp05}| {cite:t}\`gnei_sp05\`  |
| \cite{gnei_sp05} | {cite:t}\`gnei_sp05\`  |
| \\"i             | ï  |
| \prob            | p |
|\begin{itemize}   | - |
| \ref{eq:xxxx}    | {eq}\`xxxx\` |
| cf.\ Section     |cf. Section |
| \begin{equation}\label{xxx}...\end{equation} | \$\$......\$\$(xxxx) |
| yyyyy\footnote{xxxx}. | yyyyy[^footNoteIdentifier]. *`in the last Markdown cell` or anywhere* [^footNoteIdentifier]: xxxxx |

Note that we consistently apply the `footrule` before the punctuation such as ".". \
Also, 
there is no space between the last character and the [^footNoteIdentifier]

For some redundant information in the input or output cell, 
we `hide-input`, `hide-output`, or `remove-output` by adding the Tag.

### TODO: 
- domain name (feedback link)
- chapter number

At least one example per chapter?

## Contributions
| Package          | Presented by        | Verified by         |
|:----------------:|:-------------------:|:-------------------:|
|a                 |Nico Plöhn           |Santo Thies & Jiawen Wang|
|b                 |Evert Buzon          | |
|c                 |Evert Buzon          | |
|d                 |Longfei Zuo          |Santo Thies |
|e                 |Longfei Zuo          |Santo Thies & Jiawen Wang|
|f                 |Jiawen Wang          |Santo Thies   |
|g                 |Jiawen Wang          |Santo Thies & Nico Plöhn|
|h                 |Jiawen Wang          |Longfei Zuo |
|i                 |Longfei Zuo          |Santo Thies |
|j                 |Evert Buzon          | |
|k                 |Sven Morlock         |Evert Buzon |
|l                 |Sven Morlock         | |
|m                 |Sven Morlock         | |
|n                 |Nico Plöhn           |Santo Thies    |
|o                 |Nico Plöhn           |Jiawen Wang |
|p                 |Santo Thies          |Jiawen Wang & Sven Morlock|
|q                 |Santo Thies          |Jiawen Wang |
|r                 |Santo Thies          |Nico Plöhn |

## Citation
If you found this toolbox helpful, please cite the following [_Paper_](https://link.springer.com/article/10.1007/s10994-021-05946-3):

```{bibtex}
@article{DBLP:journals/ml/HullermeierW21,
  author       = {Eyke H{\"{u}}llermeier and
                  Willem Waegeman},
  title        = {Aleatoric and epistemic uncertainty in machine learning: an introduction
                  to concepts and methods},
  journal      = {Mach. Learn.},
  volume       = {110},
  number       = {3},
  pages        = {457--506},
  year         = {2021},
  url          = {https://doi.org/10.1007/s10994-021-05946-3},
  doi          = {10.1007/S10994-021-05946-3},
  timestamp    = {Fri, 14 May 2021 08:31:53 +0200},
  biburl       = {https://dblp.org/rec/journals/ml/HullermeierW21.bib},
  bibsource    = {dblp computer science bibliography, https://dblp.org}
}
```
