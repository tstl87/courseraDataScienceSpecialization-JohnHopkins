# Code Book

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAccelerometer-XYZ and timeGyroscope-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccelerometer-XYZ and timeGravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerometerJerk-XYZ and timeBodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerometerMagnitude, timeGravityAccelerometerMagnitude, timeBodyAccelerometerJerkMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyDomainSignalBodyAccelerometer-XYZ, frequencyDomainSignalBodyAccelerometerJerk-XYZ, frequencyDomainSignalBodyGyroscope-XYZ, frequencyDomainSignalBodyAccelerometerJerkMagnitude, frequencyDomainSignalBodyGyroscopeMagnitude, frequencyDomainSignalBodyGyroscopeJerkMagnitude.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*timeBodyAccelerometer-XYZ
*timeGravityAccelerometer-XYZ
*timeBodyAccelerometerJerk-XYZ
*timeBodyGyroscope-XYZ
*timeBodyGyroscopeJerk-XYZ
*timeBodyAccelerometerMagnitude
*timeGravityAccelerometerMagnitude
*timeBodyAccelerometerJerkMagnitude
*timeBodyGyroscopeMagnitude
*timeBodyGyroscopeJerkMagnitude
*frequencyDomainSignalBodyAccelerometer-XYZ
*frequencyDomainSignalBodyAccelerometerJerk-XYZ
*frequencyDomainSignalBodyGyroscope-XYZ
*frequencyDomainSignalBodyAccelerometerMagnitude
*frequencyDomainSignalBodyAccelerometerJerkMagnitude
*frequencyDomainSignalBodyGyroscopeMagnitude
*frequencyDomainSignalBodyGyroscopeJerkMagnitude

The set of variables that were estimated from these signals are: 

*mean(): Mean value
*std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

*gravityMean
*timeBodyAccelerometerMean
*timeBodyAccelerometerJerkMean
*timeBodyGyroscopeMean
*timeBodyGyroscopeJerkMean

Finally the activity and subject features contains the activity the subject is doing walking, walking upstairs, walking downstairs, sitting, standing, or laying and which subject is performing the action, respectively.