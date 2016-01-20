*** Settings ***
Library           OperatingSystem
Library           String

*** Variables ***
${SNORT}          /usr/bin/snort
${SNORTOPT}       --daq-dir=/usr/lib/daq --dynamic-preprocessor-lib-dir=/usr/lib/snort_dynamicpreprocessor

${TARGET_FILES_DIR}  ./files
${PCAP_DIR}          ./pcaps

*** Keywords ***
test setup
     Remove directory    malwares  recursive=True
     Create directory    malwares

test teardown
     Remove directory    malwares  recursive=True
     Remove directory    log  recursive=True

check snort         [Arguments]         ${return_code}   ${output}
     Log       ${output}
     Should End With          ${output}  Snort exiting

     Run keyword if  '${return_code}'=='0'    Return From Keyword

     ${error_line}= Get line  ${output} -2
     Fail snort:${error_line}

snort     [Arguments]         ${input_file}  ${conf_file}
     ${rc}    ${output}    Run and Return RC and Output
               ...  ${SNORT} -c ${conf_file} -r ${input_file} ${SNORTOPT} -k none -l . 

    check snort          ${rc}     ${output}

    [Return]   ${output}

sha256
     [Arguments]  ${file}
     ${rc}    ${output}    Run and Return RC and Output     sha256sum ${file}
     Should be equal as integers  ${rc}      0   ${output}
     @{words} =     Split string  ${output}
     Log  sha256: ${words[0]}
     [return]  ${words[0]}


Capture file
     [Documentation]  Check that module has been captured specified file
     [Arguments]         ${pcap_file}   ${target_file}

     snort  ${PCAP_DIR}/${pcap_file}    etc/snort.conf
     ${sha} =  sha256  ${TARGET_FILES_DIR}/${target_file}
     ${path} =  String.Convert to Uppercase  ${sha}

     Should exist  malwares/${path}

*** Settings ***
Test Setup            test setup
Test Teardown         test teardown
Test template         Capture file

*** Test Cases ***
36k            http/36k.pcap                      36k
Http mp3       http/http_mp3.pcap                 file.mp3
Http png       http/http_png.pcap                 file.png
Http torrent   http/http_torrent.pcap             file.torrent

ftp mp3        ftp/ftp_mp3                        file.mp3

pop3 mp3       pop3/pop3_mp3.pcap                 file.mp3
pop3 png       pop3/pop3_png.pcap                 file.png
pop3 torrent   pop3/pop3_torrent.pcap             file.torrent
imap mp3       imap/imap_mp3.pcap                 file.mp3
imap png       imap/imap_png.pcap                 file.png
imap torrent   imap/imap_torrent.pcap             file.torrent
smtp png       smtp/smtp_png.pcap                 file.png
smtp torrent   smtp/smtp_torrent.pcap             file.torrent
