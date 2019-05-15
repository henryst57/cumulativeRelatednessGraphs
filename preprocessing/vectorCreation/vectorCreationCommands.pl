#Script to generate all of the association vectors used in comparison

#####################################################
#                    Direct
####################################################
<<<<<<< HEAD
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile randomCuis_T047 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder ../../../rawData/ >& nohup_T047_current &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile randomCuis_T121 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder ../../../rawData/ >& nohup_T121_current &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile randomCuis_T184 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder ../../../rawData/ >& nohup_T184_current &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile randomCuis_T200 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder ../../../rawData/ >& nohup_T200_current &`;  

=comment
=======
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T047 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ >& nohup_T047_current &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T121 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ >& nohup_T121_current &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T184 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ >& nohup_T184_current &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T200 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ >& nohup_T200_current &`;  

>>>>>>> 396740052140c61f1ee1fed75122a41212ab4bca
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T047 --matrixName 1975_2015_window8_threshold1 --matrixFolder /../../../rawData/ >& nohup_T047_future &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T121 --matrixName 1975_2015_window8_threshold1 --matrixFolder /../../../rawData/ >& nohup_T121_future &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T184 --matrixName 1975_2015_window8_threshold1 --matrixFolder /../../../rawData/ >& nohup_T184_future &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T200 --matrixName 1975_2015_window8_threshold1 --matrixFolder /../../../rawData/ >& nohup_T200_future &`;  

#####################################################
#                    LTA
####################################################
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T047 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --lta >& nohup_T047_current_lta &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T121 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --lta >& nohup_T121_current_lta &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T184 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --lta >& nohup_T184_current_lta &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T200 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --lta >& nohup_T200_current_lta &`;  

#####################################################
#                    MWA
####################################################
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T047 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --mwa >& nohup_T047_current_mwa &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T121 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --mwa >& nohup_T121_current_mwa &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T184 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --mwa >& nohup_T184_current_mwa &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T200 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --mwa >& nohup_T200_current_mwa &`;  

#####################################################
#                    SBC
####################################################
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T047 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --sbc >& nohup_T047_current_sbc &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T121 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --sbc >& nohup_T121_current_sbc &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T184 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --sbc >& nohup_T184_current_sbc &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T200 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --sbc >& nohup_T200_current_sbc &`;  


#####################################################
#                    LSA
####################################################
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T047 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --lsa >& nohup_T047_current_lsa &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T121 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --lsa >& nohup_T121_current_lsa &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T184 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --lsa >& nohup_T184_current_lsa &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile ../../../startCuis/randomCuis_T200 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --lsa >& nohup_T200_current_lsa &`;  


#####################################################
#                    LTC
####################################################
`nohup perl getAssociationVectors.pl --measure freq --cuiFile ../../../startCuis/randomCuis_T047 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --lta >& nohup_T047_current_ltc &`;  
`nohup perl getAssociationVectors.pl --measure freq --cuiFile ../../../startCuis/randomCuis_T121 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --lta >& nohup_T121_current_ltc &`;  
`nohup perl getAssociationVectors.pl --measure freq --cuiFile ../../../startCuis/randomCuis_T184 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --lta >& nohup_T184_current_ltc &`;  
`nohup perl getAssociationVectors.pl --measure freq --cuiFile ../../../startCuis/randomCuis_T200 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /../../../rawData/ --lta >& nohup_T200_current_ltc &`;  


=comment
#WSA is weighted set association, current implementation is too slow to complete.
# wil add this in future versions
#####################################################
#                    WSA
####################################################
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile randomCuis_T047 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /home/henryst/data/ --wsa >& nohup_T047_current_wsa &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile randomCuis_T121 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /home/henryst/data/ --wsa >& nohup_T121_current_wsa &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile randomCuis_T184 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /home/henryst/data/ --wsa >& nohup_T184_current_wsa &`;  
`nohup perl getAssociationVectors.pl --measure x2 --cuiFile randomCuis_T200 --matrixName 1975_1999_window8_ordered_threshold1 --matrixFolder /home/henryst/data/ --wsa >& nohup_T200_current_wsa &`;  
=cut
