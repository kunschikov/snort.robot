# snort.robot

This is snort file capture test automation suite. 
* Install the Robot framework:
<br>
        <b>pip install robotframework</b>
<br>
 For more info read the following:
<br>
        https://code.google.com/p/robotframework/wiki/Installation
<br>
        http://robotframework.org/

* clone this repo:
<br>
    vvk@ ~/tmp $ git clone https://github.com/kunschikov/snort.robot.git
<br>    
    vvk@ ~/tmp $ cd snort.robot/

* modify the file_inspect.robot: set the SNORT and SNORTOPT variables to your system setup

*  run the suite:
<pre>
    vvk@ ~/tmp/snort.robot $ pybot file_inspect.robot 
    ==============================================================================
    File Inspect                                                                  
    ==============================================================================
    36k                                                                   | PASS |
    ------------------------------------------------------------------------------
    Http mp3                                                              | PASS |
    ------------------------------------------------------------------------------
    Http png                                                              | PASS |
    ...
    ------------------------------------------------------------------------------
    smtp torrent                                                          | PASS |
    ------------------------------------------------------------------------------
    File Inspect                                                          | FAIL |
    13 critical tests, 12 passed, 1 failed
    13 tests total, 12 passed, 1 failed
    ==============================================================================
    Output:  /home/vvk/tmp/snort.robot/output.xml
    Log:     /home/vvk/tmp/snort.robot/log.html
    Report:  /home/vvk/tmp/snort.robot/report.html
</pre>

* run one test from the suite:
 
<pre>
vvk ~/src/snort.robot $ pybot --test ftp_mp3 file_inspect.robot  
==============================================================================
File Inspect                                                                  
==============================================================================
FTP mp3                                                               | FAIL |
Path '/home/vvk/src/snort.robot/malwares/B09021B76929F3BB4A61CB8668244E559D27A078B42C6D6C960EC18316656984' does not match any file or directory
------------------------------------------------------------------------------
File Inspect                                                          | FAIL |
1 critical test, 0 passed, 1 failed
1 test total, 0 passed, 1 failed
==============================================================================
Output:  /home/vvk/src/snort.robot/output.xml
Log:     /home/vvk/src/snort.robot/log.html
Report:  /home/vvk/src/snort.robot/report.html
</pre>
* edit the preprocessor
<pre>
vvk ~/src/snort-2.9.8.0 $ vi src/dynamic-preprocessors/ftptelnet/snort_ftptelnet.c 
vvk ~/src/snort-2.9.8.0 $ make install 
</pre>
* run one test again
<pre>
vvk ~/src/snort.robot $ pybot --test ftp_mp3 file_inspect.robot  
==============================================================================
File Inspect                                                                  
==============================================================================
FTP mp3                                                               | PASS |
------------------------------------------------------------------------------
File Inspect                                                          | PASS |
1 critical test, 1 passed, 0 failed
1 test total, 1 passed, 0 failed
==============================================================================
Output:  /home/vvk/src/snort.robot/output.xml
Log:     /home/vvk/src/snort.robot/log.html
Report:  /home/vvk/src/snort.robot/report.html
</pre>
