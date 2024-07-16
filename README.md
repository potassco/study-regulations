
# Study regulations

Encodings of study regulations in Answer Set Programming that produces corresponding study plans.
Additional integration with [*clinguin*](https://clinguin.readthedocs.io/en/latest/) creating a User Interface (UI) for exploring study plans.
As an example we focus on the study regulations for the [Cognitive Systems (CogSys) Master](https://www.uni-potsdam.de/fileadmin/projects/studium/docs/03_studium_konkret/07_rechtsgrundlagen/studienordnungen/StO_CogSys_EN.pdf).

Our paper on describing this system can be found [here](https://www.cs.uni-potsdam.de/wv/publications/DBLP_conf/iclp/HahnMNO0SS23.pdf).

## Installation

* ***clingo***

  To run the encodings, *clingo* must be installed using the preferred method we advice using conda:

  ```console
  conda install potassco::clingo
  ```

* ***clinguin* v2.0**

  To use the UI *clinguin* version 2.0 must be installed following the [install instructions](https://clinguin.readthedocs.io/en/latest/clinguin/installation.html).

## Organization

### Encodings


* [`meta.lp`](./encodings/meta.lp): meta-encoding for study plans described in the paper
* [`meta-examinations.lp`](./encodings/meta-examinations.lp): extended meta-encoding including examinations
* [`show.lp`](./encodings/show.lp): *clingo* `#show` statements to simplify visualization using tuples.



### Instances

The study regulations are in the [instances directory](./instances).

* [`cogsys.lp`](./instances/cogsys/cogsys.lp): facts describing the basic study regulation for CogSys
* [`cogsys-examination.lp`](./instances/cogsys/cogsys-examinations.lp): acts describing the constraints for the examinations of CogSys
  * *Note: does not include the description of Ep, Es, ep(), es() and d*

## Use

### Solve

- Obtain a single study plan

```command
clingo instances/cogsys/cogsys.lp encodings/{meta.lp,show.lp} -c n=4 1
```


### UI with *clinguin*

- Open an interactive user interface to configure your study plan

```command
clinguin client-server --domain-files instances/cogsys/cogsys.lp encodings/meta.lp --ui-files encodings/ui.lp -c n=4
```

![](out.png)

## Tests

* `test-01`:
  - `clingo instances/cogsys/cogsys.lp encodings/{meta.lp,show.lp} tests/test-01.lp -c n=4 0 -q`
  - returns one answer set (the example of the paper)
  - returns no answer set if n=3

* `test-02`:
  - `clingo instances/cogsys/{cogsys.lp,cogsys-examinations.lp} encodings/meta-examinations.lp tests/{test-01.lp,test-02.lp} -c n=4 0 -q`
  - returns one answer set
  - returns no answer set if n=3

* `test-03`:
  - `clingo instances/cogsys/{cogsys.lp,cogsys-examinations.lp} encodings/meta-examinations.lp tests/{test-01.lp,test-03.lp} -c n=4 0 -q`
  - returns 2,048 answer sets (2^11)

* `test-04`:
  - `clingo instances/cogsys/{cogsys.lp,cogsys-examinations.lp} encodings/meta-examinations.lp tests/{test-01.lp,test-04.lp} -c n=4 0 -q`
  - returns 2,048 answer sets (2^11)

* `test-05`:
  - `clingo instances/cogsys/{cogsys.lp,cogsys-examinations.lp} encodings/meta-examinations.lp tests/{test-01.lp,test-05.lp} -c n=4 0 -q`
  - returns 7 answer sets

* `test-06`:
  - `clingo instances/cogsys/{cogsys.lp,cogsys-examinations.lp} encodings/meta-examinations.lp tests/{test-01.lp,test-06.lp} -c n=4 0 -q`
  - returns 28 answer sets

* `test-07`:
  - `clingo instances/cogsys/{cogsys.lp,cogsys-examinations.lp} encodings/meta-examinations.lp tests/{test-01.lp,test-07.lp} -c n=4 0 -q`
  - returns 18 answer sets

* `test-08`:
  - `clingo instances/cogsys/{cogsys.lp,cogsys-examinations.lp} encodings/meta-examinations.lp tests/{test-01.lp,test-08.lp} -c n=4 0 -q`
  - returns 36 answer sets
  - returns 22 answer sets if we use option --project

* `test-cogsys-exams`:
  - `clingo instances/cogsys/{cogsys.lp,cogsys-examinations.lp} encodings/meta-examinations.lp tests/test-cogsys-exams.lp -c n=3 0 -q`
  - returns 3,840 answer sets
  - returns 353,760 answer sets if n=4