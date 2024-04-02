\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coursereport}[finance course report]
\LoadClass[a4paper,zihao=5,wallpaper]{ctexart}
\RequirePackage{mathtools,amsmath,amsthm,booktabs,dcolumn,collcell,geometry,siunitx,fancyhdr,float,longtable,titling,xcolor,colortbl,bigstrut,multirow,rotating,threeparttable,graphicx,lipsum,eso-pic,inputenc,array,tocloft,caption,etoolbox,setspace,lscape,ctexheading,adjustbox,tikz,changepage,sectsty,ctex,enumitem}
\RequirePackage[most]{tcolorbox}
\RequirePackage[explicit]{titlesec}
\RequirePackage[inkscapelatex=false]{svg}

%页面设置
\newcommand{\@footfirstline}{}
\newcommand{\@footsecondline}{}
\newcommand{\footsetting}[2]{
\renewcommand{\@footfirstline}{#1}
\renewcommand{\@footsecondline}{#2}
}
\geometry{a4paper,left=3.58cm,right=2.58cm,top=2.88cm,bottom=2.54cm}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhead{}
\fancyfoot{}
\fancyfoot[R]{\rlap{\hspace*{-2ex}\textbf{\fontsize{10}{14}\selectfont \textcolor{dblue}{\@footfirstline}}}\\
\rlap{\hspace*{92.9ex}\textbf{\fontsize{8}{12}\selectfont \textcolor{dblue}{\@footsecondline}}}}
\fancyfoot[C]{\fontfamily{ppl}\selectfont --\,\,\thepage\,\,--}
\AddToShipoutPictureBG{%
\AtPageLowerLeft{\includegraphics[width=\paperwidth,height=\paperheight]{background.pdf}}%
}

%颜色定义
\definecolor{myblue}{RGB}{51,153,255}
\definecolor{ablue}{RGB}{222,245,255}
\definecolor{dblue}{RGB}{0,76,153}
\definecolor{newblue}{RGB}{0,128,255}
\definecolor{blueblue}{RGB}{14,65,156}
\definecolor{agrey}{RGB}{224,224,224}
\definecolor{bgrey}{RGB}{128,128,128}
\definecolor{nothing}{RGB}{255,255,255}
\definecolor{amzchaptercolor}{HTML}{0984e3}
\definecolor{amzdfnboxcolor}{HTML}{0984e3}
\definecolor{amzthmboxcolor}{HTML}{6c5ce7}
\definecolor{amzexboxcolor}{HTML}{fdcb6e}
\definecolor{amzgenboxcolor}{HTML}{00b894}
\definecolor{amztecboxcolor}{HTML}{e17055}
\definecolor{amzcodeboxcolor}{HTML}{2d3436}
\definecolor{amznoteboxcolor}{HTML}{d63031}

%题目文本框
\newtcolorbox{titlebox}{colback=agrey,colframe=bgrey,toprule=1.5pt,bottomrule=1.5pt,leftrule=0pt,rightrule=0pt,spread sidewards,arc=0pt,top=3pt,bottom=3pt,left=15ex,right=0pt,width=\paperwidth,sharp corners=all}
\newtcolorbox{authorbox}{colback=nothing,colframe=bgrey,toprule=0pt,bottomrule=1.5pt,leftrule=0pt,rightrule=0pt,spread sidewards,arc=0pt,top=0pt,bottom=-12pt,left=18ex,right=0pt,width=\paperwidth,sharp corners=all}

%标题文本框
\newtcolorbox{sectionbox}{colback=myblue,colframe=ablue,toprule=1.5pt,bottomrule=1.5pt,leftrule=0pt,rightrule=0pt,arc=0pt,top=0pt,bottom=0pt,left=0pt,right=0pt,width=\paperwidth,sharp corners=all}
\titleformat{\section}[display]{\xbs\huge}{}{-2em}
{\begin{tcolorbox}[enhanced,left=23mm,right=25mm,top=2mm,spread sidewards,sharp corners,colback=ablue,colframe=myblue,leftrule=0pt,rightrule=0pt,toprule=2pt,bottomrule=2pt,title=\thesection,attach boxed title to top right={xshift=-15mm, yshift=-4mm},boxed title style={size=small,colback=newblue,colframe=white}]
\strut \textcolor{black}{#1}
\end{tcolorbox}}
\titleformat{name=\section,numberless}[display]{\normalfont\huge\bfseries}{}{15pt}
{\begin{tcolorbox}[enhanced,left=23mm,right=25mm,top=2mm,spread sidewards,sharp corners,colback=myblue,colframe=myblue,boxrule=1mm,]
\strut \textcolor{white}{#1}
\end{tcolorbox}}
\titlespacing*{\section}{0pt}{0ex}{-8ex}

%题目设置
\newcommand{\@companyname}{}
\newcommand{\@stocknumber}{}
\newcommand{\@firstmember}{}
\newcommand{\@firstnumber}{}
\newcommand{\@secondmember}{}
\newcommand{\@secondnumber}{}
\newcommand{\@thirdmember}{}
\newcommand{\@thirdnumber}{}
\newcommand{\@fourthmember}{}
\newcommand{\@fourthnumber}{}
\makeatletter
\renewcommand\@maketitle{%
\newpage\null\vskip 3em%
\let\footnote\thanks
\begin{flushleft}
{\LARGE \@title \par}%
\vskip 0em%
\end{flushleft}
\begin{center}%
{\large\lineskip 0em%
\begin{tabular}[t]{c}%
\@author
\end{tabular}\par}%
\vskip 0em%
{\large \@date}%
\end{center}%
\par
\vskip 0em}
\makeatother
\newcommand{\setthetitle}[2]{%
	\title{\vspace{-1.5cm}\textbf{\fontsize{28pt}{0} \selectfont \hspace{-1.1cm}#1\qquad(#2)}\vspace{-1.7cm}}%
}
\date{}
\makeatletter
\newcommand{\reporttitle}[1]{
	\thispagestyle{empty}
	\begin{titlebox}
		{\fontsize{24pt}{3pt}\selectfont #1}
\end{titlebox}}
\newcommand{\theteammember}[8]{%
\begin{authorbox}
\begin{spacing}{1}
\noindent
组员：\quad #1\quad#2
				
\quad\quad\quad\quad #3\quad#4
				
\quad\quad\quad\quad #5\quad#6
				
\quad\quad\quad\quad #7\quad#8
\end{spacing}\end{authorbox}}
\makeatother


%摘要环境
\newenvironment{summary}{\begin{adjustwidth}{-2cm}{+1.5cm}\begin{enumerate}[label=\bfseries\arabic*.]
\vspace{4ex}}{\end{enumerate}
\end{adjustwidth}\newpage
\thispagestyle{empty}
\tableofcontents
\thispagestyle{empty}
\newpage
\thispagestyle{empty}
\listoffigures
\listoftables
\thispagestyle{empty}
\newpage
\pagenumbering{arabic}}
		
%字体设置
\setCJKmainfont{STKaiti}[BoldFont={SimHei}]
\setmainfont{TeX Gyre Termes}
\usepackage{unicode-math}
\setmathfont{TeX Gyre Termes Math}
\setCJKfamilyfont{xbs}{FZXiaoBiaoSong-B05S}
\newcommand{\xbs}{\CJKfamily{xbs}}
\setCJKfamilyfont{hwxh}{STXihei}
\newcommand{\hwxh}{\CJKfamily{hwxh}}
\setCJKfamilyfont{hwzs}{STZhongsong}
\newcommand{\hwzs}{\CJKfamily{hwzs}}

%标题样式设置
\ctexset{section={name={,.},format=\xbs\zihao{3},aftername=\hspace{7pt},beforeskip=6ex,afterskip=4.5ex,indent={-4em},},subsection={format=\heiti\zihao{-4},aftername=\hspace{8pt},beforeskip=4ex,afterskip=1.5ex,indent={-2em}},subsubsection={format=\songti\zihao{5},aftername=\hspace{7pt},beforeskip=0.8ex,afterskip=-5ex}}
\subsectionfont{\color{blueblue}}
\subsubsectionfont{\normalfont\songti}

%正文行距
\linespread{1.25}
\setlength{\parskip}{0.4em}

%目录索引与图片索引
\renewcommand{\listfigurename}{\hwzs 图表索引}
\renewcommand{\contentsname}{\hwzs 目录索引}
\renewcommand{\listtablename}{}
\renewcommand{\cfttabpresnum}{表}
\setlength{\cfttabnumwidth}{2.5em}
\renewcommand{\cftfigpresnum}{图}
\setlength{\cftfignumwidth}{2.5em}

%表格设置
\renewcommand{\captionfont}{\zihao{-5}\fangsong}
\captionsetup[table]{skip=0pt} 
\AtBeginEnvironment{tabular}{\zihao{-5}}
\AtBeginEnvironment{longtable}{\zihao{-5}}
\renewcommand\TPTnoteSettings{\zihao{6}\hwxh}