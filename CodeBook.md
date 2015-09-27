Getting and Cleaning Data Course Project

##Code Book For The Dataset

This dataset comes from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 


###Variable Name Convention:
1. The prefix "t" --> a measurement in time domain, like tbody.

2. The prefix "f" --> a measurement in frequency domain, like fbody.
 
3. "body" --> body linear acceleration

4. "acc"  --> acceleration

5. "gravity"  --> gravity acceleration

6. "gyro" --> data from gyroscope

7. "Jerk" -->

8. "angle" --> angle between two vectors

9. "mean" --> the mean(average) value of the sample data for the variables

10. "std"  --> standard deviation of the sample data. 
 
11. "mag" --> magnitude

12. "x, y, z" --> 3-axial signals in the X, Y and Z directions.

###Variable List
col# | col name

1	| subjectid

2	| activity

3	| tbodyaccmeanx

4	| tbodyaccmeany

5	| tbodyaccmeanz

6	| tbodyaccstdx

7	| tbodyaccstdy

8	| tbodyaccstdz

9	| tGravityaccmeanx

10	| tGravityaccmeany

11	| tGravityaccmeanz

12	| tGravityaccstdx

13	| tGravityaccstdy

14	| tGravityaccstdz

15	| tbodyaccJerkmeanx

16	| tbodyaccJerkmeany

17	| tbodyaccJerkmeanz

18	| tbodyaccJerkstdx

19	| tbodyaccJerkstdy

20	| tbodyaccJerkstdz

21	| tbodygyromeanx

22	| tbodygyromeany

23	| tbodygyromeanz

24	| tbodygyrostdx

25	| tbodygyrostdy

26	| tbodygyrostdz

27	| tbodygyroJerkmeanx

28	| tbodygyroJerkmeany

29	| tbodygyroJerkmeanz

30	| tbodygyroJerkstdx

31	| tbodygyroJerkstdy

32	| tbodygyroJerkstdz

33	| tbodyaccmagmean

34	| tbodyaccmagstd

35	| tGravityaccmagmean

36	| tGravityaccmagstd

37	| tbodyaccJerkmagmean

38	| tbodyaccJerkmagstd

39	| tbodygyromagmean

40	| tbodygyromagstd

41	| tbodygyroJerkmagmean

42	| tbodygyroJerkmagstd

43	| fbodyaccmeanx

44	| fbodyaccmeany

45	| fbodyaccmeanz

46	| fbodyaccstdx

47	| fbodyaccstdy

48	| fbodyaccstdz

49	| fbodyaccmeanfreqx

50	| fbodyaccmeanfreqy

51	| fbodyaccmeanfreqz

52	| fbodyaccJerkmeanx

53	| fbodyaccJerkmeany

54	| fbodyaccJerkmeanz

55	| fbodyaccJerkstdx

56	| fbodyaccJerkstdy

57	| fbodyaccJerkstdz

58	| fbodyaccJerkmeanfreqx

59	| fbodyaccJerkmeanfreqy

60	| fbodyaccJerkmeanfreqz

61	| fbodygyromeanx

62	| fbodygyromeany

63	| fbodygyromeanz

64	| fbodygyrostdx

65	| fbodygyrostdy

66	| fbodygyrostdz

67	| fbodygyromeanfreqx

68	| fbodygyromeanfreqy

69	| fbodygyromeanfreqz

70	| fbodyaccmagmean

71	| fbodyaccmagstd

72	| fbodyaccmagmeanfreq

73	| fbodybodyaccJerkmagmean

74	| fbodybodyaccJerkmagstd

75	| fbodybodyaccJerkmagmeanfreq

76	| fbodybodygyromagmean

77	| fbodybodygyromagstd

78	| fbodybodygyromagmeanfreq

79	| fbodybodygyroJerkmagmean

80	| fbodybodygyroJerkmagstd

81	| fbodybodygyroJerkmagmeanfreq

82	| angletbodyaccmeangravity

83	| angletbodyaccJerkmeangravitymean

84	| angletbodygyromeangravitymean

85	| angletbodygyroJerkmeangravitymean

86	| anglexgravitymean

87	| angleygravitymean

88	| anglezgravitymean

##Data Clean Up

1. After merge of two datasets (train and test), only select 88 columns from original 561 columns based on the project requirement in step 5.

2. Removed "-", ",", "()" from the original variable names.

3. Converted all upper case letters to the lower cases.

4. Replaced activity number 1:6 to the meaningful names as following:

   1 --> WALKING

   2 --> WALKING_UPSTAIRS

   3 --> WALKING_DOWNSTAIRS

   4 --> SITTING

   5 --> STANDING

   6 --> LAYING
   
   ##Data Transformations
   The final tiny data is the mean and std summary grouped by subject and activity. 
