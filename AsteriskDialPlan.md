## Sample dial plans for Asterisk Systems ##

**Configuration file: extensions.conf (Asterisk)**

**Configuration file: extensions\_custom.conf (FreePBX & Trixbox)**
```
[macro-rx-fax]
; ${ARG1} is Fax Number
; ${ARG2} is Fax Recipient Email Address eg: user@domain.tld
exten => s,1,NoOp(**** FAX RECEIVE ****)
exten => s,n,Set(FAXOPT(ecm)=yes)
exten => s,n,Set(FAXOPT(headerinfo)=Your Company)
exten => s,n,Set(FAXOPT(localstationid)=${ARG1})
exten => s,n,Set(FAX2EMAIL=${ARG2})
exten => s,n,Set(FAXOPT(maxrate)=14400)
exten => s,n,Set(FAXOPT(minrate)=2400)
exten => s,n,Set(FAXFILE=${STRFTIME(${EPOCH},,%Y%m%d-%H%M%S)}-${CALLERID(number)})
exten => s,n,ReceiveFAX(/path/to/directory/${FAXFILE}.tiff)
exten => h,1,DeadAGI(efax4asterisk.sh|${FAXFILE}|${CALLERID(number)}|${CALLERID(name)}|${FAXOPT(remotestationid)}|${FAXOPT(pages)}|${FAXOPT(rate)}|${FAXOPT(resolution)}|${FAXOPT(status)}|${FAXOPT(statusstr)}|${FAXOPT(error)}|${FAX2EMAIL})
exten => h,n,NoOp(FAXOPT(status) : ${FAXOPT(status)})
exten => h,n,NoOp(FAXOPT(statusstr) : ${FAXOPT(statusstr)})
exten => h,n,NoOp(FAXOPT(error) : ${FAXOPT(error)})
; end of macro-rx-fax


[ext-did-custom] ; Remove this line if you are not using (FreePBX or Trixbox)
exten => 8005551212,1,Macro(rx-fax,8005551212,user@domain.tld)
exten => 8005551213,1,Macro(rx-fax,8005551213,email@google.com)
exten => 2122003000,1,Macro(rx-fax,2122003000,different@yahoo.com)

```