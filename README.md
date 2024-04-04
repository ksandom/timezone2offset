# timezone2offset

A command line tool to get a sorted list of UTC offsets from a list of timezone abbreviations.

## Examples

You can give it a single parameter:

```
ksandom@delli:~$ tz2o CST
Offset  Abbreviation  Description
UTC−06  CST           Central Standard Time (Central America)
UTC−05  CST           Cuba Standard Time
UTC+08  CST           Time in China|China Standard Time
```

You can pipe a whole load of timezones at once:

```
ksandom@delli:~$ echo "  GMT
  UTC
  ECT
  EET
  ART
  EAT
  MET
  NET
  PLT
  IST
  BST
  VST
  CTT
  JST
  ACT
  AET
  SST
  NST
  MIT
  HST
  AST
  PST
  PNT
  MST
  CST
  EST
  IET
  PRT
  CNT
  AGT
  BET
  CAT " | tz2o
Offset     Abbreviation  Description
UTC−11     SST           Samoa Standard Time
UTC−10     HST           Hawaii–Aleutian Standard Time
UTC−09:30  MIT           Marquesas Islands Time
UTC−08     PST           Pacific Standard Time (North America)
UTC−07     MST           Mountain Standard Time (North America)
UTC−06     CST           Central Standard Time (Central America)
UTC−05     EST           Eastern Standard Time (North America)
UTC−05     ECT           Ecuador Time
UTC−05     CST           Cuba Standard Time
UTC−05     ACT           Acre Time
UTC−04     ECT           Eastern Caribbean Time (does not recognise DST)
UTC−04     AST           Atlantic Standard Time
UTC−03     ART           Argentina Time
UTC−03:30  NST           Newfoundland Standard Time
UTC+01     BST           British Standard Time from Mar 1968 to Oct 1971)
UTC+01     IST           Irish Standard Time
UTC+01     MET           Middle European Time (''same zone as CET'')
UTC+02     CAT           Central Africa Time
UTC+02     EET           Eastern European Time
UTC+02     IST           Israel Standard Time
UTC+03     AST           Arabia Standard Time
UTC+03     EAT           East Africa Time
UTC+05:30  IST           Indian Standard Time
UTC+06     BST           Bangladesh Standard Time
UTC+08:00  ACT           ASEAN Common Time (proposed)
UTC+08     CST           Time in China|China Standard Time
UTC+08     MST           Malaysia Standard Time
UTC+08     SST           Singapore Standard Time
UTC+09     JST           Japan Standard Time
UTC+11     AET           Australian Eastern Time
UTC+11     BST           Bougainville Standard Time


```

You can pipe the output to another program, and it will send it in CSV format:

```
ksandom@delli:~$ tz2o BST | cat -
Offset,Abbreviation,Description
UTC+06,BST,Bangladesh Standard Time
UTC+11,BST,Bougainville Standard Time
UTC+01,BST,British Standard Time from Mar 1968 to Oct 1971)
```

Any case is understood:

```
ksandom@delli:~$ tz2o nzdt
Offset  Abbreviation  Description
UTC+13  NZDT          New Zealand Daylight Time
ksandom@delli:~$ tz2o NzDt
Offset  Abbreviation  Description
UTC+13  NZDT          New Zealand Daylight Time
ksandom@delli:~$ tz2o NZDT
Offset  Abbreviation  Description
UTC+13  NZDT          New Zealand Daylight Time
```

If you want to run the output through another program, but want to have the user formatting, you can do so like this:

```
ksandom@delli:~$ echo "BST" | tz2o
Offset  Abbreviation  Description
UTC+01  BST           British Standard Time from Mar 1968 to Oct 1971)
UTC+06  BST           Bangladesh Standard Time
UTC+11  BST           Bougainville Standard Time

ksandom@delli:~$ echo "BST" | tz2o | grep -v Brit
Offset,Abbreviation,Description
UTC+06,BST,Bangladesh Standard Time
UTC+11,BST,Bougainville Standard Time

ksandom@delli:~$ echo "BST" | tz2o | grep -v Brit | tz2o reformat
Offset  Abbreviation  Description
UTC+06  BST           Bangladesh Standard Time
UTC+11  BST           Bougainville Standard Time
```

You can list everything:

```
ksandom@delli:~$ tz2o all
Offset            Abbreviation  Description
UTC−12            IDLW          UTC-12|International Date Line West time zone
UTC−12            BIT           Baker Island Time
UTC−11            SST           Samoa Standard Time
UTC−11            NUT           Niue Time
UTC−10            TAHT          Tahiti Time
UTC−10            SDT           Samoa Daylight Time
UTC−10            HST           Hawaii–Aleutian Standard Time
UTC−10            CKT           Cook Island Time
UTC−09            HDT           Hawaii–Aleutian Daylight Time
<...snipped for conciseness>
```
