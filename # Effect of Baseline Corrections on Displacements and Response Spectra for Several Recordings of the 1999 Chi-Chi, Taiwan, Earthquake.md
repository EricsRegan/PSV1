# Effect of Baseline Corrections on Displacements and Response Spectra for Several Recordings of the 1999 Chi-Chi, Taiwan, Earthquake

by David M. Boore

Abstract Displacements derived from many of the accelerometer recordings of the 1999 Chi-Chi, Taiwan, earthquake show drifts when only a simple baseline derived from the pre-event portion of the record is removed from the records. The appearance of the velocity and displacement records suggests that changes in the zero level of the acceleration are responsible for these drifts. The source of the shifts in zero level are unknown, but in at least one case it is almost certainly due to tilting of the ground. This article illustrates the effect on the ground velocity, ground displacement, and response spectra of several schemes for accounting for these baseline shifts. A wide range of final displacements can be obtained for various choices of baseline correction, and comparison with nearby GPS stations (none of which are colocated with the accelerometer stations) do not help in choosing the appropriate baseline correction. The results suggest that final displacements estimated from the records should be used with caution. The most important conclusion for earthquake engineering purposes, however, is that the response spectra for periods less than about 20 sec are usually unaffected by the baseline correction. Although limited to the analysis of only a small number of recordings, the results may have more general significance both for the many other recordings of this earthquake and for data that will be obtained in the future from similar high-quality accelerometer networks now being installed or soon to be installed in many parts of the world.

# Introduction

This is a follow-up study to one published soon after the earthquake (Boore, 1999). At the time of that study, data from only two strong-motion stations were available; now 422 strong-motion accelerograms from free-field sites have been released (Lee et al., 1999, 2001), and many other types of data regarding the earthquake are available, including some GPS measurements (Central Geological Survey, 1999). I have repeated my 1999 study using data from a number of stations—most on the hanging-wall side of the fault and two on the footwall side of the fault (Fig. 1). The findings from the previous study are unchanged: baseline corrections of the digital data are needed, various reasonable baseline-correction schemes can lead to wildly different final displacements, and the response spectra are largely unaffected by the baseline corrections for oscillator periods less than about 20 sec.

# Data

The digital accelerometer network installed and maintained by the Central Weather Bureau in Taiwan produced a rich set of records from the 20 September 1999 M 7.6 ChiChi, Taiwan, earthquake and its aftershocks (Shin et al.,

2000). This earthquake produced the most complete set of strong-motion recordings ever obtained. The data for all but one station used in this article were obtained from Teledyne Geotech Model A900 digital recorders, with  $\pm 2\mathrm{g}$  gain and 16-bit resolution, recorded at 200 samples per sec. Data at one station (WNT) were obtained from a 12-bit digital recorder (Teledyne Geotech Model 800). The transducers are flat to acceleration from 0 to  $50\mathrm{Hz}$ . The system uses a trigger algorithm and a buffer so that the pretrigger part of the ground motion is captured.

A zeroth-order correction has been applied to all records by removing the mean determined from a segment of the pre-event part of the original record from the whole original acceleration record. For simplicity of expression, I refer to these as uncorrected accelerations, although a correction has in fact been applied.

Estimates of coseismic deformation were also obtained from GPS data, although these data are not as readily available as the accelerometer data. A report, in Chinese, by the Central Geological Survey (1999) contains maps and tables of Global Positioning System (GPS) measurements. I have used GPS data from stations closest to the accelerometer data and similarly located with respect to the hanging-wall and

![](images/01b9e3a8b62c811950db6213e2f64d2e1a6f810757ef168a368d32c6f977c3dc.jpg)  
Figure 1. Map showing surface expression of fault (jagged line), strong-motion stations (open circles), and GPS stations (filled circles) that provided data used in this article. The coordinates of the GPS stations are approximate; they were scaled from a figure from the Central Geological Survey (1999).

footwall sides of the fault. These stations are shown on the map in Figure 1.

# The Need for Baseline Corrections

Modern digital instruments have the potential to allow the recovery of the complete ground displacements from accelerometer records recorded close to large earthquakes. One such example is shown in Figure 2. The only correction applied to the recorded motions was the removal of the pre-event mean from the whole record. The velocities and displacements were obtained by integration of the accelerations. The displacements reach essentially constant residual values, and the velocities oscillate around zero after the end of the strong shaking. This behavior of the velocities is a reasonable constraint on any ground-motion recording unless the recording is from the presumably rare earthquake that has a large amount of afterslip immediately following the strong shaking. Unfortunately, the behavior of the ve

![](images/758f0780966cf0524fc96b8423c97c6e98d8e9ad3b90bec58b4812f2c1382a6d.jpg)  
Figure 2. Three components of motion recorded at station TCU074. The top three traces are accelerations for which the pre-event mean was removed from the whole record. These are followed by the velocities and displacements obtained by integrating the accelerations. Note that there is no evidence of a baseline offset.

locities in Figure 2 is the exception rather than the rule for recordings of the Chi-Chi mainshock. A more usual case is shown in Figure 3 (for the E-W component of the motion at TCU129). The motion in the figure was obtained by first subtracting from the whole acceleration trace the mean of a portion of the pre-event interval of the acceleration trace—this guarantees that the velocity will be zero near the beginning of the record—and then integrating. The almost linear trend in velocity is a direct indication that the baseline of the acceleration for at least the last half of the record is not the same as that from the pre-event portion of the record.

![](images/106bb7ec2df362360e1d01dced269a2f995630bac8377ce989977ce989da43ba.jpg)  
Figure 3. Shaded line: velocity from integration of the EW component of acceleration recorded at TCU129 after removal of the pre-event mean from the whole record. A least-squares line was fit to the velocity from 65 sec to the end of the record. Various baseline corrections were obtained by connecting the assumed time of zero velocity  $t_1$  to the fitted velocity line at time  $t_2$ . Three values of  $t_2$  are shown: 30, 50, and 70 sec.

Although not shown here, the same features are present in many of the accelerogram recordings of the earthquake. The difference in acceleration baseline levels need not be large to produce the observed slope in the velocity and the correspondingly large final displacement (in excess of  $19\mathrm{m}$  for the E-W component at TCU129). For the record shown in Figure 3, a straight line fit to the last 25 sec of the velocity has a slope of  $-1.3~\mathrm{cm / sec^2}$ ; this is a direct measure of the difference in acceleration baselines. The displacement at a time  $t$  after a step in acceleration of  $\delta a$  is  $0.5\delta a^2$ . For  $\delta a = 1.3~\mathrm{cm / sec^2}$ , this gives  $1625~\mathrm{cm / sec^2}$  after 50 sec; a small shift in acceleration baseline will have a profound effect on the final displacement. The next section considers several ways of correcting for changes in the acceleration baseline.

# Correcting for Baseline Offsets

In an ideal world the physical mechanism for the baseline shifts would be so well known that the correction scheme could be tailored to the cause. Unfortunately, this is not the case for the recordings of the Chi-Chi earthquake, and therefore some rather ad hoc correction schemes must be used. In this article I use a generalization of the scheme proposed by Iwan et al. (1985). In processing digital records, they observed drifts in the velocity and displacement records similar to those shown in Figure 3. For the instruments that they were testing, they attributed the source of the baseline

shift to a hysteresis in the transducer that occurred when acceleration exceeded about  $50~\mathrm{cm} / \mathrm{sec}^2$ . The consequence was that the baseline could be changing in a complicated way during the interval of strongest shaking, the result being that the baseline offset after the strong shaking would probably be different than the baseline before the strong shaking. To correct for this model of baseline shifts, Iwan et al. (1985) proposed that two baselines be removed:  $a_{\mathrm{m}}$  between times  $t_1$  and  $t_2$ , and  $a_{\mathrm{f}}$  from time  $t_2$  to the end of the record (this is shown in Fig. 4). The value  $a_{\mathrm{m}}$  is an average of the possibly complicated shifts in baseline that could occur during the strong shaking. Because many of the velocities derived from the uncorrected acceleration records from the Chi-Chi earthquake show an approximately linear trend for long times, I have adopted the Iwan et al. (1985) correction. In so doing, I am not making the assumption that the source of the baseline shifts is as found by Iwan et al., or that there is a threshold above which the baseline shifts take place. Laboratory tests on the instruments that recorded the Chi-Chi earthquake showed no signs of hysteresis or baseline offsets (F. Wu, written comm., 2001; H.-C. Chiu, written comm., 2001).

The level  $a_{\mathrm{f}}$  is determined from the slope of a line fit to a portion of the velocity trace following the strong shaking:

$$
v _ {\mathrm {f}} (t) = v _ {0} + a _ {\mathrm {f}} t. \tag {1}
$$

In application, the  $\nu_{\mathrm{f}}$  line is found by least-squares fitting of a portion of the velocity from  $t_{\mathrm{f1}}$  to  $t_{\mathrm{f2}}$ . It would be preferable to set  $t_{\mathrm{f1}}$  to a time well after the strong shaking has subsided. This is not always possible, in which case the coefficients  $\nu_{0}$  and  $a_{\mathrm{f}}$  can be somewhat uncertain. I performed a few tests of the sensitivity of the corrected velocities and displacements to the choice of  $t_{\mathrm{f1}}$  and found that the results are not very sensitive to the choice; this, of course, should be checked for cases in which the records cease recording soon after the strong shaking. The second time,  $t_{\mathrm{f2}}$ , is usually chosen to be the end of the record, unless the record is very long, in which case subsequent changes in acceleration baseline well after strong shaking has ceased can lead to a nonlinear trend in velocity (I have seen such cases in records from California earthquakes, but not for the Chi-Chi earthquake).

The correction  $a_{\mathrm{m}}$  is determined by the requirement that the final velocity, after baseline correction, average to zero. This is satisfied if the velocity of the baseline correction at the end of the  $t_1 - t_2$  interval  $(a_{\mathrm{m}}(t_2 - t_1))$ , equals the velocity from the fitted line  $(\nu_{\mathrm{f}}(t_2))$ . This gives the equation

$$
a _ {\mathrm {m}} = \frac {v _ {\mathrm {f}} \left(t _ {2}\right)}{\left(t _ {2} - t _ {1}\right)}. \tag {2}
$$

The key to the method is in choosing the times  $t_1$  and  $t_2$ . Based on their particular instrument, Iwan et al. (1985) chose  $t_1$  as the time that the absolute value of the acceleration

![](images/4f19d4b077fc6a2f6d8cd6cbf596a2d951281fab2e957d82848a448337f33227.jpg)  
Figure 4. Basis of Iwan et al. (1985) baseline correction scheme (see text) (modified from Boore, 1999). The light and heavy lines are for two choices of  $t_2$ .

![](images/6913af6404c3ec82ffcc7bf079e32794bf885b7e0fe48929e254e4b9e3167e6d.jpg)

first exceeds  $50~\mathrm{cm} / \mathrm{sec}^2$ . One of my generalizations of the Iwan et al. method is to allow  $t_1$  to be a free parameter, not determined by a threshold of shaking. For  $t_2$ , any value between  $t_1$  and the end of the record will satisfy the constraint that the average of the corrected velocity be zero near the end of the record (I require in all cases that  $t_2 \geq t_1$ ). Iwan et al. (1985) proposed two specific options for  $t_2$ : (1)  $t_2$  is the time after which the acceleration never exceeds  $50~\mathrm{cm} / \mathrm{sec}^2$ ; (2)  $t_2$  is chosen to minimize the final displacement (see Boore [1999] for more discussion and equations determining  $t_2$  in terms of the fitted velocity, the length of the record, and the final value of the uncorrected displacement). Another option, not discussed by Iwan et al., is to choose  $t_2$  as the time at which the line fit to velocity becomes zero. Using equation (1), this time is

$$
t _ {2} = - v _ {0} / a _ {\mathrm {f}}. \tag {3}
$$

I refer to a baseline correction using this choice of  $t_2$  as the  $\nu_{\mathrm{fit}} = 0$  or the  $\nu_0$  correction. Of course, this correction only works if  $t_2$  determined from equation (3) falls between  $t_1$  and  $t_\mathrm{f}$ , where  $t_\mathrm{f}$  is the time at the end of the record. As with  $t_1$ , in this article I allow  $t_2$  to be a free parameter—this is my other generalization of the Iwan et al. method. As I will show, if  $t_2$  is free to float between  $t_1$  and  $t_\mathrm{f}$ , the final displacement derived from the corrected acceleration can have a wide range of values. Without knowledge of the specific mechanisms for the baseline offsets, however, it is difficult to choose one value over another. This is the essence of the uncertainty in determining final displacements from accelerometer records subject to unknown shifts in the baseline.

My generalization of the Iwan et al. (1985) method is only one of numerous possible correction schemes (e.g., Graizer, 1979; Boore et al., 2001). The choice of the correction method should be guided by the long-time behavior of the velocity time series derived from the uncorrected acceleration.

# The Effect of  $t_2$ : TCU129, E-W Component

I have already used the record of E-W acceleration from TCU129 as an example of the need for baseline corrections (Fig. 3). Continuing to use this as an example, Figure 3 also shows the line fitted to velocity between 65 and 90 sec, as well as the velocity corrections obtained from a single choice of  $t_1$  (20 sec, essentially the start of motion) and three choices of  $t_2$ : 30 sec, 50 sec, and 70 sec. The velocity traces obtained from integration of the acceleration corrected using two values of  $t_2$ , 30 sec and 70 sec, are shown in Figure 5, in which it can be seen that the constraint of zero average velocity near the end of the record is satisfied. Although the velocity traces shown in Figure 5 may not look too different, the displacement traces resulting from double integration of the baseline-corrected acceleration trace are hugely different, as seen in Figure 6. The choice of 30 sec or 70 sec for  $t_2$  results in a difference of final displacement of almost  $400~\mathrm{cm}$ , and the displacements are of opposite sign. At this point common sense and a knowledge of the faulting can come into play. As Figure 1 shows, station TCU129 is close to the surface breakout of the fault, but on the footwall side of the fault. Because the fault is an eastward-dipping thrust fault, I expect eastward motion at TCU129, but not as large as  $400~\mathrm{cm}$ .

![](images/c9b221a1722915efc2ae5227fabcda0cd317d4e47d34c35818e2b2c25d0bc0b5.jpg)  
Figure 5. Velocities obtained from integration of the EW component of acceleration recorded at TCU129 after applying baseline corrections with  $t_1 = 20$  sec and  $t_2$  of 30 sec and 70 sec (see Fig. 3).

![](images/f3ec598240d6845df6da7b856f79b57edd3663a90518573abd47994e163d26ef.jpg)  
Figure 6. Displacements obtained by double integration of the EW component of acceleration recorded at TCU129 (shown in top panel) and modified using a variety of baseline corrections. The GPS level was obtained at a station  $2.3\mathrm{km}$  from TCU129, on the footwall side of the fault.

This means that it is unlikely that the choice of either 30 sec or 70 sec is appropriate (and this assumes that the two-segment baseline correction scheme is a good model of the actual baseline offsets that occurred on the record). Figure 6 also shows the consequence of several other choices of  $t_2$ , as well as option 1 of Iwan et al. For option 1,  $t_1$  is close to the value assumed for the other corrections in the figures, and  $t_2$ , chosen as the time after which the acceleration never exceeds  $50~\mathrm{cm} / \mathrm{sec}^2$ , is quite long (68 sec). This option leads to an unacceptably large final displacement. The GPS values, from a station  $2.3~\mathrm{km}$  from TCU129, is close to the value obtained using the  $\nu_{\mathrm{fit}} = 0$  value for  $t_2$  (i.e., equation 3). An exact match to the GPS results can be found for an appropriate choice of  $t_2$ , but of course, this is meaningless because if GPS data are available, the determination of final displacement from the acceleration records is not necessary, and if GPS data are not available, there is no guarantee that the value of  $t_2$  that works for the particular trace will work for other components at the same station or for records obtained at other stations.

# The Effect of  $t_1$ : TCU068, N-S Component

Using the logic of Iwan et al.,  $t_1$  should be chosen at the place in the record at which baseline shifts start to occur. It is not always clear where this should be. If the baseline shifts are associated with strong shaking, then  $t_1$  should be chosen at the beginning of the strong shaking. For TCU129, the onset of shaking and the onset of strong motion were nearly coincident, but such is not the case for many other records. For example, the motion at TCU068 starts near a time of 20 sec, but the strong shaking (as measured by the criteria of Iwan et al. of the motion exceeding  $50~\mathrm{cm} / \mathrm{sec}^2$ ) is close to a time of 30 sec. Figure 7 shows the consequence of two choices of  $t_1$ : 20 sec and 30 sec. As for the previous example, the final displacement is quite sensitive to  $t_2$  when  $t_1 = 20$  sec (left figure). The choice of  $t_1 = 30$  sec seems much better (right figure) because there is little sensitivity to  $t_2$  and the results are close to the GPS results. The reason for the insensitivity to  $t_2$  is because the time determined from the fitted velocity being zero (equation 3) is 31.0 sec, which is close to the chosen value of  $t_1$ . If  $t_1$  were chosen as exactly the time that the velocity of the fitted line is zero, then there will be no sensitivity of the final displacement to  $t_2$ . In effect, in that case the model assumes that the baseline changed at a single instant of time ( $t_1$ ). In addition to the final displacements, the character of the displacements in the first 20 sec after the start of the motion is sensitive to the choice of  $t_1$ : the large downswing obtained for many values of  $t_2$  when  $t_1 = 20$  sec largely disappears when  $t_1 = 30$  sec.

Notice that  $t_1 = 30$  sec is close to the time at which the strong shaking starts. For this reason, some might argue that  $t_1 = 20$  sec is obviously a poor choice; although it corresponds to the start of motion, the shaking is so small that no baseline changes should be expected. If the baseline shift

![](images/0bc706155cbdd2ffa5d791173e3aa7f94b8745598579a4a87236dfad00f22bd0.jpg)

![](images/d1b40e6469a4e47ba51be306085120e5fedc6b18c28811326d9b79d87aec8a0f.jpg)  
Figure 7. Displacements obtained by double integration of the NS component of acceleration recorded at TCU068 (shown in top panel) and modified using a variety of baseline corrections. The left figure used  $t_1 = 20$  sec, while the right figure used  $t_1 = 30$  sec. The GPS level was obtained at a station  $4.3$  km from TCU068, on the hanging-wall side of the fault.

![](images/7e8417cf8213e91020ece57c772f69f0ed0954f8604a27b96114927d0af04148.jpg)

always occurred at a single time corresponding to the onset of strong shaking, as seems to be the case for the N-S component of TCU068, then the correction for the baseline shift would be simple. Unfortunately, things are not always so simple. For example, experience at the U.S. Geological Survey with digital instruments indicates that baseline shifts can occur for small levels of shaking (C. Stephens, oral comm., 2000; Boore et al., 2001). Furthermore, the time given by equation (3) for the E-W component at TCU068 (39.4 sec) is about 10 sec after the start of strong shaking. Substituting the E-W component for the NS component in Figure 7 would lead to a similar figure if  $t_1 = 40$  sec rather than 30 sec, except that the final offset would not agree as well with the GPS results (Fig. 8).

# Comparison with GPS: TCU052, TCU068, TCU102, TCU129, All Components

Obviously the best way of judging the baseline-corrected final displacements is to compare them with independently determined displacements such as those from GPS measurements. As far as I know, none of the accelerometer stations were colocated with GPS stations, and therefore exact comparisons cannot be made. I have chosen the GPS stations closest to the accelerometer stations studied in this article (Fig. 1). In the best case (TCU102) the GPS station was  $1.7\mathrm{km}$  from the accelerometer station; in the worst case (TCU052) the closest GPS station was  $6.5\mathrm{km}$  away. Figures 8 and 9 show displacements for all components at four stations, compared to GPS. In these figures,  $t_1 = 20$  sec. Be

![](images/acab084252cc861f499a1f3e0a32c5d8027e09b5c76642a3f53dbc164eeac72b.jpg)

![](images/60645c1d86e04d843dae0dd8754878db5352d21c1a7e6355d5b5748efa6c5e62.jpg)

![](images/9d7b85e24de0691906ced23d63cdebe5fdc5cce1f2113fd6a509cc9c41450249.jpg)

![](images/cf9ffee137808f2cdf8c1758355370cc0f7947e97226f2414829f3d51072d7c7.jpg)  
Figure 8. Displacements obtained by double integration of the three components of acceleration recorded at stations TCU052 and TCU068 and modified using a variety of baseline corrections. The legend for the type of corrections is shown in Figure 7 and is not included here to avoid clutter. The GPS levels were obtained from stations 6.5 km (G103) and  $8.3\mathrm{km}$  (AFT25) from TCU052 and  $4.3\mathrm{km}$  from TCU068; the accelerometer and GPS stations are on the hanging-wall side of the fault.

![](images/72d3b1100a711e8a890002a31bdafdc541379e7ffd7419267c8c99da2f90ddd1.jpg)

![](images/ef8d5efec2e7ca1b4d1fbb7a66be015f1f61554b461f9857f334bc0b92b1749b.jpg)

cause there were no GPS stations close to TCU052, the displacements from the two nearest GPS stations are plotted for TCU052. Figures 8 and 9 show a number of things: for the stations on the hanging-wall side of the fault (TCU052, TCU068), the final vertical displacements are not sensitive to the baseline correction, and they are close to the GPS values (this may not be a general feature for all vertical components). On the other hand, for the horizontal components at the same stations there is more sensitivity to  $t_2$ , and the value of  $t_2$  favored by comparison with the GPS measurements is not clear, although on balance it seems as if a value close to that given by equation (3) works well. There are clear exceptions to this latter conclusion, however, such as TCU068, E-W, for which the GPS result is  $300\mathrm{cm}$  different than when using the  $\nu_{\mathrm{fit}} = 0$  correction (Fig. 8) and TCU102, N-S, and TCU129, U-D, for which  $t_2$  from equation (3) exceeded the length of the record. In spite of the uncertainties, the overall sense of the final displacements is captured

by the derived displacements, particularly for the stations on the hanging-wall side of the fault (which have larger displacements than the stations on the footwall side of the fault). For both TCU052 and TCU068 the final displacements are north, west, and up, in agreement with GPS results and expectations from the style of faulting.

# The Source of the Offsets: Ground Tilting At TCU129, WNT

A number of causes of the baseline offsets have been proposed, including tilting (either dynamic or permanent), the response of the transducer to strong shaking, or problems in the analog-to-digital converter. Of course, one or a combination of causes might exist. In this article, I focus on the effect of tilting. As discussed by Boore (1999), very small tilts in the instruments can produce baseline shifts of the order observed in the records, at least for the horizontal com

![](images/79f06dd2527f0bcd616c78d3a18ba9bd0e6afd081c81d0f41b95d5e07a62e183.jpg)

![](images/f1c74a1f11e70216e088904b36ba12ec4153791f04822bdb88c4b3c70dd872dc.jpg)

![](images/4af2b9aaf70e904015b6c70d31feea21a13a5bc3a2a69aea66019985bae53a8f.jpg)

![](images/fed4c27199bb2fcf790327ce97d675d716cf4fb7ac7c4645a3bb76d3b0362c56.jpg)  
Figure 9. Displacements obtained by double integration of the three components of acceleration recorded at stations TCU102 and TCU129 and modified using a variety of baseline corrections. The legend for the type of corrections is shown in Figure 7 and is not included here to avoid clutter. The GPS levels were obtained from stations 1.7 km from TCU102 and  $2.3\mathrm{km}$  from TCU129; the accelerometer and GPS stations are on the footwall side of the fault.

![](images/1d1855343242ce2b08d559446c9c12b2a9faa1b41dc768d7a0f43035a00f4b57.jpg)

![](images/f097c3adc92c063f043a69186b9a4eea3276f93150a6f060c09cfafdf84cb1fc.jpg)

ponents of motion. A tilt of  $\theta$  produces a shift in baseline of

$$
\Delta g = g \sin (\theta) \tag {4}
$$

for horizontal components and

$$
\Delta g = g (1 - \cos (\theta)) \tag {5}
$$

for the vertical component. Baseline changes of about  $1\mathrm{cm}/$ $\mathrm{sec}^2$  are not uncommon (the change implied from Fig. 3 is  $1.3~\mathrm{cm / sec}^2)$  . From equation (4), this corresponds to a tilt of only 0.001 radians or 0.06 degrees. The change in baseline caused by this very small tilt will produce a large displacement after a long duration-in excess of  $10\mathrm{m}$  after 50 sec. This suggests that even without the type of instrumentdependent baseline shifts discussed by Iwan et al. (1985), it will be very difficult to obtain permanent ground displacements from double integration of horizontal component accelerations. The effect of tilt on vertical components should be much smaller (being proportional to  $0.5\theta^{2}$  rather than  $\theta$

for small tilts), however, and therefore there is some hope that permanent ground motions can be obtained from vertical recordings.

I have found fairly direct evidence of tilt for station TCU129. The A900 instrument at this site is about  $50~\mathrm{cm}$  from an A800 instrument that also recorded the mainshock (this instrument is referred to as station WNT). The two instruments are on the same concrete pier in a small room (W. Lee, written comm., 2001). Wen et al. (2000) demonstrate that the high-frequency motions at this site may be affected by the pier itself, but my concern here is with longer period motions. A comparison of the velocities derived from the uncorrected accelerations is given in Figure 10 for all three components. Although there are substantial differences in shape and phase of the two recordings, indicating differences in instrument response, the velocities from both instruments show similar trends on the horizontal components and a much smaller trend in the vertical-component velocities. This is best explained as being due to tilt of the instruments. In most cases, however, the source of the baseline

![](images/f573da6cb5b294afe2b0a027d01308a18d7b6b410844a630d735436f90e0beca.jpg)

![](images/912aeba6d4352eaa619d3ca7d95d5919a989887b2e525165d196c6a14f0955b6.jpg)  
Time (s)

![](images/6349d6e50908a1f5a43895cf82f075efb81dd769ef640f67156c963c25513c5a.jpg)  
Figure 10. Velocities obtained by integration of the accelerations recorded at stations TCU129 and WNT. The stations were colocated; only the instruments differ (they were about  $50~\mathrm{cm}$  apart on a  $1\mathrm{m}$  by  $1\mathrm{m}$  pier (W. Lee, written comm., 2001)). The traces have been arbitrarily aligned on the early arrivals.

offset or offsets is unknown. In some cases the shift seems to occur at different times on different components at the same station, making it less likely to be due to tilt.

# The Influence of Baseline Correction on Response Spectra

From the equation for an oscillator, it is easy to show that the maximum response of the oscillator should equal the

maximum displacement of the ground shaking for large oscillator periods. For this reason, if different baseline corrections produce large differences in peak ground displacements (as shown in Fig. 6 for TCU129, EW), the displacement response spectra should also be very different at long periods. The critical question is at what period the differences will start to occur. Some idea of this can be obtained from the response of an oscillator to a step  $a_{\mathrm{bl}}$  in acceleration. From equation (A4b) in Boore (1999), this is

![](images/f1d140405fb84f66e6f021a4e8edf35e41897b489641ad0e1230fc9cf90fbbf5.jpg)  
Figure 11. Relative displacement response spectra computed from (a) the N-S component of acceleration recorded at TCU068 and (b) the E-W component of acceleration recorded at TCU129. The accelerations used in computing the response spectra were modified using a variety of baseline corrections, as indicated in the legends.

![](images/cacc31661dbafb17d0676065bf9d9baf77178692a14a517d86d9b3a8a501d4e5.jpg)

![](images/78d7819c467243d2e3a54b768bb035dbb333badfe637aeb8bde8f53fd6bf2438.jpg)  
Figure 12. Relative displacement response spectra computed from the E-W component of acceleration recorded at (a) TCU084 and (b) TCU089. The accelerations used in computing the response spectra were modified using a variety of baseline corrections, as indicated in the legends. Note that unlike response spectra at other stations, the response spectrum from TCU084 is sensitive to the baseline corrections for oscillator periods as short as 6 sec.

![](images/04ac01777fdf194e2d4780e2451f7843bf6874e6c3977beb3ac0cd23011dd496.jpg)

$$
\left| u _ {\max } \right| = a _ {\mathrm {b l}} T ^ {2} \frac {(1 + \exp (- \eta \pi / \sqrt {1 - \eta^ {2}}))}{4 \pi^ {2}}, \tag {6}
$$

where  $T$  and  $\eta$  are the undamped natural period and the fractional damping an oscillator. Although the response spectrum of the sum of two time series (the baseline offset and the ground acceleration in our case) is not the sum of the individual response spectra, the response of the baseline shift alone gives an upper bound to the effect of a step in acceleration. With  $a_{\mathrm{bl}} = 1 \, \mathrm{cm/sec}^2$  and  $\eta = 0.05$ ,

$$
u _ {\max } = 0. 0 4 7 T ^ {2}. \tag {7}
$$

Because of the strong dependence on period, the effect of a step in acceleration will be much more important at long periods than at short periods. For a period of 1 sec, the response is only  $0.05\mathrm{cm}$ , whereas at 20 sec the response is  $19\mathrm{cm}$ .

From the analysis above, I would expect that uncertainties in response spectra due to unknown baseline shifts of the order of  $1\mathrm{cm} / \mathrm{sec}^2$  will be unimportant at periods of engineering interest. This can be shown directly by comparing the displacement response spectra for the time series derived from various baseline-correction schemes. Comparisons for TCU068, N-S, and TCU129, E-W, are shown in Figure 11. The figure shows that the response spectra are

largely insensitive to the choice of baseline correction for oscillator periods less than about 20 sec (this includes response spectra obtained from records for which only a mean value has been removed). Comparisons for a number of other records, not shown here, give similar results.

A glaring exception to the conclusion that the response spectra are not sensitive to the baseline correction at periods less than about 20 sec is shown in Figure 12a for the E-W component of TCU084 processed in various ways; here the differences start at a period of about 6 sec. It is instructive to investigate why this is different than other comparisons. Figure 12b shows the response spectra for a nearby recording, TCU089, corrected in the same ways as TCU084. Although TCU089 is only about  $5\mathrm{km}$  from TCU084 (Fig. 1), the response spectra corresponding to the different baseline corrections are very different than those at TCU084, and the differences are not important until the oscillator periods exceed about 20 sec. The ground displacements for the various baseline corrections are shown in Figure 13 for both stations. Clearly the displacements for TCU084 are more variable than for TCU089, but this is not the whole story (recall that the wide range of displacements for the E-W component at TCU129, shown in Fig. 6, did not affect the response spectra for periods less than 20 sec, as shown in Fig. 11b). The Fourier acceleration spectra for both stations are compared in Figure 14. This and similar comparisons for several other

![](images/e8074c6cb0a3c3bce1869bcb5ace2a4e4abc80898e79a5e06cb2801870c1329f.jpg)  
Figure 13. Displacement time series computed from the E-W component of acceleration recorded at (a) TCU084 and (b) TCU089. The accelerations from which the displacements were obtained were modified using a variety of baseline corrections, as indicated in the legends. Note that the displacements from TCU089 are relatively insensitive to the baseline corrections, unlike the displacements for TCU084.

![](images/e39f82e946919c36c59e038c5e52b1717b776034b914d8d831a92efacddc8744.jpg)

![](images/d3e8874c2c8e21aa1e8e2ea33cdb857c5c68e558b530fb458ea2e933720b614f.jpg)  
Figure 14. Fourier acceleration spectra computed from the EW component of acceleration recorded at TCU089 and TCU084. The accelerations from which the spectra were computed were corrected using the  $\nu 0$  correction.

nearby sites show that the motion at TCU084 is highly anomalous, being strongly enriched in motions around  $1\mathrm{Hz}$ . Whether this is site response or a malfunction of the instrument is not important for this discussion. What is important is how this influences the computation of response spectra. Figure 15 compares the Fourier acceleration spectra with the oscillator response for oscillator periods of 2 and 10 sec. The plot is in terms of frequency and uses linear axes, since this is what is used in the Fourier transform that would give the oscillator time series. The oscillator response to acceleration is flat at low frequencies. If the input acceleration lacks energy at the period of the oscillator, the oscillator will reach to other periods to obtain its response. If the differences at low frequencies are large enough, as they are at TCU084 for the 10-sec oscillator but not for the 2-sec oscillator, then the response spectra will be different. This example shows that predicting the period at which response spectra will be sensitive to baseline processing can be difficult, depending as it does on the interplay between the oscillator response and the frequency content of the ground motion. In my experience, the differences seen for TCU084 are the exception and not the rule for recordings of the Chi-Chi mainshock.

Figures 11 and 12 show the response of linear oscillators; I have not done similar comparisons for nonlinear os

![](images/681692f599f768ee2e578b943f293060d9dd0d828138f4b1da48922b456182ae.jpg)  
Figure 15. Heavy lines: a portion of the Fourier acceleration spectra computed from the EW component of acceleration recorded at (a) TCU084 and (b) TCU089. Two spectra are shown in each figure, one from accelerations corrected by removing the pre-event mean from the whole record, and one from accelerations corrected using the v0 correction. Except at low frequencies, the two spectra coincide with one another. Thin lines: the responses of  $5\%$  -damped oscillators with natural periods of 2 and 10 sec to acceleration. The oscillator response has been normalized to fit on the graphs.

cillators, for which the resonant periods tend to lengthen as the amplitude of shaking increases. For all but the most unusual structures, however, oscillator response is only important for periods much less than 10 sec, and so the conclusion regarding the nonimportance of baseline correction for engineering purposes should still hold (I would not expect the nonlinearity to extend the periods to be greater than 20 sec).

# Discussion and Conclusions

Baseline corrections are needed for many, if not most, of the digitally recorded accelerograms obtained from the 1999 Chi-Chi, Taiwan, earthquake. The residual displacements derived from these records can be sensitive to the choice of baseline correction, but the response of oscillators with periods less than about 20 sec are usually not sensitive to the baseline corrections. This is good news for engineering purposes, for which most structures are not influenced by such long periods. The residual displacements derived from the accelerograms should be used with caution, however, in seismological models of the rupture process. If ground motions at long periods are desired, the processing must be done on a record-by-record basis, using the velocity time series as a guide to what processing to do, and studying the sensitivity of the derived displacements to the processing parameters.

# Acknowledgments

I wish to thank Willie Lee for encouragement to do this study and Hsi-Ping Liu for providing the GPS data and accelerometer site conditions from publications written in Chinese. The accelerometer data were provided by the Central Weather Bureau of Taiwan, as published by Lee et al. (1999, 2001). Chris Stephens, Hsi-Ping Liu, and John Douglas provided thoughtful reviews of the manuscript. In addition, the comments of the reviewers Hung-Chie Chiu and Francis Wu were very helpful. In particular, Dr. Chiu pointed out that no corrections were needed for station TCU074, and his comments prompted me to look at the motions from stations TCU084 and TCU089, which in turn led me to a more thorough understanding of the influence of different displacements on the response spectra.

# References

Boore, D. M. (1999). Effect of baseline corrections on response spectra for two recordings of the 1999 Chi-Chi, Taiwan, earthquake, U.S. Geol. Surv. Open-File Rept. 99–545, 37 pp.  
Boore, D. M., C. D. Stephens, and W. B. Joyner (2001). Comments on baseline correction of digital strong-motion data: examples from the 1999 Hector Mine, California, earthquake, Bull. Seism. Soc. Am. (submitted).  
Central Geological Survey (1999). Investigative Report on the Earthquake Geology of the September 21 Earthquake, Central Geological Survey, The Ministry of Economic Affairs, Taiwan, Republic of China (in Chinese).  
Converse, A. M. (1992). BAP: Basic strong-motion accelerogram processing software, version 1.0, U.S. Geol. Surv. Open-File Rept. 92-296A.  
Graizer, V. M. (1979). Determination of the true ground displacement by using strong motion records, Izvestiya Phys. Solid Earth 15, 875-885.  
Iwan, W. D., M. A. Moser, and C.-Y. Peng (1985). Some observations on strong-motion earthquake measurement using a digital accelerometer, Bull. Seism. Soc. Am. 75, 1225-1246.  
Lee, W. H. K., T. C. Shin, K. W. Kuo, and K. C. Chen (1999). CWB Free-Field Strong-Motion Data from the 921 Chi-Chi Earthquake, digital acceleration files on CD-ROM, Seismology Center, Central Weather Bureau, Taipei, Taiwan, pre-publication version, 6 December 1999, Vol. 1.  
Lee, W. H. K., T. C. Shin, K. W. Kuo, K. C. Chen, and C. F. Wu (2001). CWB Free-Field Strong-Motion Data from the 9-21-1999 Chi-Chi Earthquake, digital acceleration files on CD-ROM, Seismology Center, Central Weather Bureau, Taipei, Taiwan, publication version, 9 January 2001, Vol. 1.  
Shin, T. C., K. W. Kuo, W. H. K. Lee, T. L. Teng, and Y. B. Tsai (2000). A preliminary report on the 1999 Chi-Chi (Taiwan) earthquake, Seism. Res. Lett. 71, 24-30.  
Wen, K. L., H. Y. Peng, Y. B. Tsai, and K. C. Chen (2000). Why 1g was recorded at TCU129 site during the 1999 Chi-Chi, Taiwan earthquake? in Proc. Int. Workshop on Annual Commemoration of Chi-Chi Earthquake, C.-H. Loh and W.-I. Liao (Editors), National Center for Research on Earthquake Engineering, Taipei, Taiwan, Vol. 1, 263-278.

U.S. Geological Survey, MS 977

345 Middlefield Road

Menlo Park, California 94025

boore@usgs.gov

Manuscript received 25 July 2000.