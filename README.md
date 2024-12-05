
# Study regulations
> An ASP-based system for reasoning about study regulations

## Description

This repository contains ASP encodings to:
* generate study plans using [*clingo*](https://potassco.org/clingo/), and
* generate a User Interface (UI) to explore study plans using [*clinguin*](https://clinguin.readthedocs.io/en/latest/).

As an example, we focus on the study regulations for the [Cognitive Systems (CogSys) Master](https://www.uni-potsdam.de/fileadmin/projects/studium/docs/03_studium_konkret/07_rechtsgrundlagen/studienordnungen/StO_CogSys_EN.pdf).

For a formal description of the system, please read our [paper](https://www.cs.uni-potsdam.de/wv/publications/DBLP_conf/iclp/HahnMNO0SS23.pdf).

## Installation

* ***clingo***

  To run the encodings, *clingo* must be installed, for example, using conda:

  ```console
  conda install potassco::clingo
  ```

* ***clinguin* v2.0**

  To run the UI, *clinguin* version 2.0 must be installed, following these [installation instructions](https://clinguin.readthedocs.io/en/latest/clinguin/installation.html).

## Organization

### Encodings


* [`encoding.lp`](./encodings/encoding.lp): encoding - encoding to generate study plans (described in the paper).
* [`encoding-examinations.lp`](./encodings/encoding-examinations.lp): extended encoding - encoding including examination tasks.
* [`show.lp`](./encodings/show.lp): `#show` statements to simplify the visualization.



### Instances

Specific study regulations can be found in the [instances directory](./instances):

* [`cogsys.lp`](./instances/cogsys/cogsys.lp): basic study regulations for CogSys Master.
* [`cogsys-examinations.lp`](./instances/cogsys/cogsys-examinations.lp): extension of CogSys Master with examination tasks.
* [`cogsys-examinations-constraint.lp`](./instances/cogsys/cogsys-examinations-constraint.lp): CogSys Master examination tasks constraints (described in the paper).

## Usage

### Solving with *clingo*

- Obtain a single study plan

```command
clingo instances/cogsys/cogsys.lp encodings/{encoding.lp,show.lp} -c n=4 1
```


### UI with *clinguin*

- Open an interactive UI to configure your study plan

```command
clinguin client-server --domain-files instances/cogsys/cogsys.lp encodings/encoding.lp --ui-files encodings/ui.lp -c n=4
```

![](img/out.png)

