# snort.robot

This is snort file capture test automation suite. 
 * Install the Robot framework:
        #pip install robotframework
 For more info read the following:
        https://code.google.com/p/robotframework/wiki/Installation
        http://robotframework.org/

 * clone this repo:
    vvk@ ~/tmp $ git clone https://github.com/kunschikov/snort.robot.git
    vvk@ ~/tmp $ cd snort.robot/
* modify the file_inspect.robot: set the SNORT and SNORTOPT variables to your system setup

*  run the suite:
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
    vvk@ ~/tmp/snort.robot $ 


