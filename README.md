# Requierements for the webpage to run locally via `pip<3> install`
    - jupyter-book
    - ghp-import
    - matplotlib
    - numpy
    - (and various other machine learning packages)

# How to just build locally and not push to public
run 
```
jupyter-book build .
```

On how to run locally see top \
<span style="color: red">
General remark: It is important to run this with the activated python enviroment in the terminal you use to program the jupyternotebooks.</span>


# How to view locally the website
open the line after `build/htmtl/index.html` in the terminal from your favorite browser 

# How to build a new page and push to public
run the following commands in the terminal:
```
chmod +x build.zsh
./build.zsh
``` 

The changes will only be made public if *build.zsh* is called in the git *main* branch.
<span style="color: red">
General remark: It is important to run this with the activated python enviroment in the terminal you use to program the jupyternotebooks.</span>

# How to organize Chapters
First a general explanation how jupyter-book works. The _toc.yml file is the organizer keeping everything at bay and defining the structure.\
 If we want to add a new page, we simply add * - file <path/filename> * to the end of the file ( where the other -file commands are). To have supchapters it is important to now that ```#``` are seen as big page titles whereas ```##``` are the "true" supchapters of a page. 
 Thus when adding content we have the two options
## Option 1: Use mutliple files
First put everthing nice and tight into a folder *<folder>*.\
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
## Option 2: Use one file (not recommended I think)
Just write one big juypter file and structure the chapters with ```#``` indicating the main page name. ```##``` and ```###```for the supchapters.
