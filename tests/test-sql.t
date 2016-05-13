  $ . $TESTDIR/setup.t.bash
  $ export TESTLANG=sql

  $ printf 'select * from a as b' | annotator
  Annotation(0, 6, select, ['showdocs-decorate-back'], 0) u'select'
  Annotation(9, 13, from, ['showdocs-decorate-back'], 0) u'from'
  Annotation(16, 18, as, ['showdocs-decorate-back'], 0) u'as'
  Annotation(0, 8, select, ['showdocs-decorate-block'], 0) u'select *'
  Annotation(9, 13, from, ['showdocs-decorate-block'], 0) u'from'
  Annotation(14, 20, table_name, ['showdocs-decorate-back'], 0) u'a as b'

  $ annotator <<EOF
  > select * from a where b = c
  > EOF
  Annotation(0, 6, select, ['showdocs-decorate-back'], 0) u'select'
  Annotation(9, 13, from, ['showdocs-decorate-back'], 0) u'from'
  Annotation(16, 21, where, ['showdocs-decorate-back'], 0) u'where'
  Annotation(0, 8, select, ['showdocs-decorate-block'], 0) u'select *'
  Annotation(9, 13, from, ['showdocs-decorate-block'], 0) u'from'
  Annotation(16, 27, where, ['showdocs-decorate-block'], 0) u'where'..u'b = c'
  Annotation(14, 15, table_name, ['showdocs-decorate-back'], 0) u'a'

  $ annotator <<EOF
  > CREATE TABLE films (
  >     code        char(5) CONSTRAINT firstkey PRIMARY KEY,
  >     title       varchar(40) NOT NULL,
  >     did         integer NOT NULL,
  >     date_prod   date,
  >     kind        varchar(10),
  >     len         interval hour to minute
  > );
  > EOF
  Annotation(0, 6, create, ['showdocs-decorate-back'], 0) u'CREATE'
  Annotation(7, 12, table, ['showdocs-decorate-back'], 0) u'TABLE'
  Annotation(45, 55, constraint, ['showdocs-decorate-back'], 0) u'CONSTRAINT'
  Annotation(65, 72, primary, ['showdocs-decorate-back'], 0) u'PRIMARY'
  Annotation(73, 76, key, ['showdocs-decorate-back'], 0) u'KEY'
  Annotation(106, 114, not null, ['showdocs-decorate-back'], 0) u'NOT NULL'
  Annotation(140, 148, not null, ['showdocs-decorate-back'], 0) u'NOT NULL'
  Annotation(231, 233, to, ['showdocs-decorate-back'], 0) u'to'
  Annotation(234, 240, minute, ['showdocs-decorate-back'], 0) u'minute'
  Annotation(0, 243, createtable, ['showdocs-decorate-block'], 0) u'CREAT'..u'te\n);'
  Annotation(13, 18, table_name, ['showdocs-decorate-back'], 0) u'films'
