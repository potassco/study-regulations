# Tests

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