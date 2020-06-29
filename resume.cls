\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}

\LoadClassWithOptions{article}

\RequirePackage{marvosym}
\RequirePackage{fontspec} 					
\RequirePackage{xunicode,xltxtra,url,parskip} 	
\RequirePackage{color,graphicx}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage[big]{layaureo} 				
\RequirePackage{supertabular} 			
\RequirePackage{titlesec}
\RequirePackage{hyperref}
\RequirePackage{amssymb}
\RequirePackage{collect}
\RequirePackage{fontspec}
\RequirePackage[T1]{fontenc}
\RequirePackage{tgschola}
\RequirePackage{ifthen}
\RequirePackage{pgfkeys}
\RequirePackage[absolute]{textpos}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{geometry}

\geometry{a4paper, margin=2cm, voffset=0.5cm}

\titleformat{\section}{\Large\scshape\raggedright}{}{0em}{}[\titlerule]
\hyphenation{im-pre-se}


\addtolength{\topmargin}{-.1in}


\setlength{\TPHorizModule}{30mm}
\setlength{\TPVertModule}{\TPHorizModule}
\textblockorigin{2mm}{0.65\paperheight}
\setlength{\parindent}{0pt}


\definecolor{linkcolour}{rgb}{0,0.2,0.6}
\hypersetup{colorlinks,breaklinks,urlcolor=linkcolour, linkcolor=linkcolour}



\pagestyle{empty}
\setlength{\parindent}{0em}

% --- SPACING ---

\titlespacing*{\section}{0pt}{6mm}{3mm}


% --- FORMAT ---

\newcommand{\noskip}[0]{\parskip=0pt}


% --- TITLE ---

\renewcommand{\title}[1]{\par{\centering{\Huge\textsc{#1}}\bigskip\par}}


% --- SPLIT ---

\newenvironment{split}
    {\begin{tabular}{>{\raggedleft}p{2.9cm}|p{13cm}}}
    {\end{tabular}}


% --- TASKS ---

\let\@noitemerr\relax
\setlist[itemize]{topsep=0pt, parsep=0pt, leftmargin=0em}

\newenvironment{tasks}
{\vspace{-6pt}\small\begin{itemize}[nosep,noitemsep,label=]}
{\vspace{-12pt}\end{itemize}}


% --- EXPERIENCE ---

\pgfkeys{
    /experience/.is family, /experience,
    default/.style = {
        position = {Software Engineer},
        until = Current}
    ,
    position/.estore in = \position,
    company/.estore in = \company,
    from/.estore in = \from,    
    until/.estore in = \until,
    key/.estore in = \key,
}

\newenvironment{experience}[1][]
{   
    \pgfkeys{/experience, default, #1}
    \begin{split}
    \sc{\from} & \bf{\position{} at \company} \\
    \ifthenelse{\equal{\until}{Current}}
        {\emph{\until}}{\sc{\until}}
    &   \begin{tasks}
}
{
    \end{tasks} \\
    \bf{\small{Key Result}}  & \small{\key}        
    \end{split}
}


% --- EDUCATION ---

\pgfkeys{
    /education/.is family, /education,
    default/.style = {
        university = {Babe\c{s}-Bolyai University, Cluj-Napoca},
        until = Current}
    ,
    university/.estore in = \university,
    from/.estore in = \from,
    until/.estore in = \until,    
    degree/.estore in = \degree,
    major/.estore in = \major,
    thesis/.estore in = \thesis
}

\newenvironment{education}[1][]
{   
    \pgfkeys{/education, default, #1}
    \begin{split}
        \sc{\from} & \bf{\degree{} in \major} \\
        \ifthenelse{\equal{\until}{Current}}
            {\emph{\until}}{\sc{\until}} & \university \\
        &\begin{tasks}
}
{
    \end{tasks}\\
    \small{Thesis} & \small{\thesis}
    \end{split}
}


% --- SKILLS ---

\pgfkeys{
    /sskills/.is family, /sskills,
    category/.estore in = \category,
    skills/.estore in = \iskills
}

\newcommand{\skills}[1][]{   
    \pgfkeys{/sskills, #1}
    \begin{split}
        \sc{\category} & \small\iskills
    \end{split}
    \noskip
}

% --- CONTACT ---

\pgfkeys{
    /dcontact/.is family, /dcontact,
    name/.estore in = \name,
    value/.estore in = \value,
    link/.estore in = \link
}

\newcommand{\contact}[1][]{   
    \pgfkeys{/dcontact, #1}
    \begin{split}
        \sc{\name} & \href{\link}{\value}
    \end{split}
    \noskip
}
