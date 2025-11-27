# Effect of causal and acausal filters on elastic and inelastic response spectra

David M. Boore $^{1,\ast,\dagger}$  and Sinan Akkar $^{2,\ddagger}$

$^{1}$ MS 977, 345 Middlefield Road, U.S. Geological Survey, Menlo Park, CA 94025, U.S.A.  
 $^{2}$ Department of Civil and Environmental Engineering, Stanford University, Stanford, CA 94305, U.S.A.

# SUMMARY

With increasing interest in displacement spectra and long-period motions, it is important to check the sensitivity of both elastic and inelastic response spectra to the filtering that is often necessary to remove long period artifacts, even from many modern digital recordings. Using two records of very different character from the  $\mathbf{M} = 7.1$ , 1999 Hector Mine, California, earthquake, we find that the response spectra can be sensitive to the corner periods used in causal filtering, even for oscillator periods much less than the filter corner periods. The effect is most pronounced for inelastic response spectra, where the ratio of response spectra computed from accelerations filtered at 25 and 200 sec can be close to a factor of 2 for oscillator periods less than 5 sec. Published in 2003 by John Wiley & Sons, Ltd.

KEY WORDS: inelastic displacement response; elastic displacement response; baseline correction; causal/ acausal digital filters; non-linear response history; Hector Mine earthquake

# 1. INTRODUCTION

Design of long-period structures such as bridges, storage tanks, base-isolated structures, and very tall buildings requires knowledge of ground motions beyond the range often obtainable from analog recordings of strong ground motion. In addition, the development of displacement-based design has focused attention on both elastic and inelastic displacement response spectra. The studies reported in References [1-5] are among the few that employ elastic and inelastic spectra for design and seismic performance assessment of structures. The new generation of digital instruments now makes it possible to obtain much longer-period motions than available before, but unfortunately, the recordings are often contaminated by very small offsets

and transients in the acceleration time series that translate to unacceptable drifts in displacement time series derived from the recorded accelerations. These are addressed in various studies such as in References [6-8]. These drifts often cannot be removed with confidence by baseline correction alone, and filtering to remove long periods usually is required, as it almost always has been for digitized analog recordings. Some well-known filtering and baseline correction procedures are described in References [9-12]. (A note on terminology: by 'filtering' we mean a filter that removes motions at periods longer than the filter corner period; because the corner periods of concern to us in this paper are greater than or equal to 25 sec, we prefer to speak in terms of the period, rather than the frequency, of the filters, and because of this we cannot use the more usual adjectives 'low-cut' or 'high-pass' to describe the filters, because these have meaning only if frequency is the independent variable.) The new instruments, however, allow filtering at periods much longer than periods of engineering interest, especially for recordings of moderate to large earthquakes [13]. Often acausal (phaseless) filters are used, but these require pre-event pads to allow for full development of the filter response and can produce peculiar pre-event transients, particularly in records for which a true pre-event portion is not available (without pads, long-period content may not be completely removed and subsequent filtering of the velocity and displacement records may be needed). Starting with the 1999, Hector Mine, California, earthquake, the U.S. Geological Survey (USGS) has been using causal filters in routine processing of digital records (http://nsmp.wr.usgs.gov/processing.html). In addition, the records in the strong-motion database of the Pacific Earthquake Engineering Research Center (PEER) have been processed using causal filters (http://peer.berkeley.edu/smcat/process.html). Causal filters do not require pre-event pads to maintain compatibility between the acceleration, velocity, and displacement time series, but they can produce significant phase distortions for periods in the signal within several multiplicative factors of the corner periods of the filters. Large phase distortions can produce considerable differences in the waveforms of displacement time series obtained from acceleration records processed with a series of causal filters. Because inelastic response spectra can be more sensitive to phase information than elastic response spectra, we investigate in this paper the influence of the type of filtering on both inelastic and elastic response spectra. Our conclusion is that inelastic response spectra are sensitive to the corner periods of causal filters at periods much less than the corner periods of the filters. Elastic response spectra are much less sensitive to the filter corner periods. To illustrate the conclusions, we show results from two recordings of the  $\mathbf{M} = 7.1$ , 1999 Hector Mine, California, earthquake. Similar results were obtained from analysis of a limited number of other recordings (we have yet to find a counterexample). The additional records and earthquakes producing the motions are: the  $228^{\circ}$  component at Rinaldi Receiving Station ( $\mathbf{M} = 6.7$ , 1994 Northridge, California, earthquake), the EW component at stations TCU084 and TCU089 ( $\mathbf{M} = 7.6$ , 1999 Chi-Chi, Taiwan, earthquake); and the  $51^{\circ}$  component at Pump Station 10 from the  $\mathbf{M} = 7.9$ , 2002 Denali National Park, Alaska, earthquake.

We judge that the sensitivity of the inelastic response spectra to filter corner periods outweighs the advantage of less file storage space for compatible acceleration, velocity, and displacement times series, as well as the lack of precursory transient motions, and therefore we recommend that acausal filters be used in processing. This is hardly a new recommendation, as most strong-motion processing is done using phaseless filters. Lee and Trifunac [14] explicitly state that phaseless filters 'are required and essential' in earthquake engineering data processing, presumably so that the resulting records have minimal distortion and can be used

for a wide variety of applications (as pointed out to us by one of the anonymous reviewers). We are not aware of any publications comparing the elastic and inelastic responses of ground acceleration processed with causal and acausal filters.

# 2. DATA USED

The  $\mathbf{M} = 7.1$ , 1999 Hector Mine, California, earthquake was the first earthquake in the United States to be well recorded by digital strong-motion instruments. Figure 1 shows some of the stations at which digital recordings were obtained, as well as an indication of the areas ruptured in the earthquake. From these data we have chosen to study in detail the EW component from station HEC and the NS component from station 530. The acceleration and displacement time series, as well as the  $5\%$  -damped elastic displacement response spectra are shown in Figure 2.

![](images/7e72a562fb3e5a716089c69a27494a32094f341c2112fe59434511aba4961d7b.jpg)  
Figure 1. Map showing some of the stations that recorded the 1999 Hector Mine earthquake. Records from stations labeled 530 and HEC were used in this paper. The three rectangles near the epicenter are the surface projections of the fault planes used in Ji et al.'s [16] fault model; the epicenter is shown by the star. The numerical labels are the serial numbers of the recorders at the stations; these numbers are used in naming the data files provided by the USGS. The official NSMP station numbers are different, but they have not been used (to avoid confusion in relating a station shown on the map with the data file for the time series recorded at that station). Records from all stations shown here were digitally recorded. The records from station 530 were digitized using about 4280 counts/ $\mathrm{cm} / \mathrm{s}^2$ ; those from station HEC were digitized at 2140 counts/ $\mathrm{cm} / \mathrm{s}^2$ . The sensors at all stations are force-balance accelerometers with natural frequency greater than  $50\mathrm{Hz}$ . The data from TriNet station HEC were obtained through the Southern California Earthquake Data Center (SCEDC); the data from station 530 are from the National Strong-Motion Program (NSMP) of the U.S. Geological Survey (http://nsmp.wr.usgs.gov). (This figure is from Boore DM, Stephens CD, Joyner WB. Comments on baseline correction of digital strong-motion data: Examples from the 1999 Hector Mine, California, earthquake. Bulletin of the Seismological Society of America 2002; 92:1543-1560 © Seismological Society of America.)

![](images/c9bf60ad3b9cf69bbaa9c1d648f9843c163526f612258f52c9316832bb052c4c.jpg)

![](images/764745b912459ebf700bfd72fe76a3cad383a7037783d1d89aa0fafd050d6fe8.jpg)

![](images/a9e1149af4fb9420cea3c950557dc05d760b7f3498422e62ebf9377bdf26ed4c.jpg)

![](images/617b21b7e8661954bcb51cba1f6d8ba357066d08fd4ad5f1480cc1efd368cfd5.jpg)

![](images/dc52920167a40441669795f0a1e28e18adde77787ed89006cabc032e9f676ee6.jpg)  
Figure 2. Acceleration and displacement time series and elastic  $5\%$  -damped displacement response spectra  $(SD)$ . For consistency in presentation, the time series from both stations have been filtered using a causal filter with corner period of  $50\mathrm{sec}$ . The pre-filtering baseline correction for the station 530 record corresponded to the removal of a quadratic fitted to velocity; that for the HEC record corresponded to several straight line segments in velocity between  $t_1 = 15\mathrm{s}$ ,  $t_2 = 50\mathrm{s}$ , and the end of the record. See Boore et al. [13] for details regarding the baseline removal. We have shown just one component of acceleration so as to avoid clutter (this paper concentrates on longer period information, so little is lost by not showing both components of the acceleration). The time series used in this paper are shown by black lines. Note that the NS component for the recording at station 530 is within  $4^{\circ}$  of the purely transverse component. Also note the different scaling of the ordinates for the plots of data from 530 and HEC.

![](images/f3c1305a308e26d32f41b33c0405cbefeed365afd14bb48a3d4119ed5eaf5c91.jpg)

The displacements from station 530 show a substantial pulse in the transverse direction (this direction is within  $4^{\circ}$  of north-south, and therefore we analyze the north-south component). This pulse produces a peak in the displacement response spectrum at a period exceeding 10 sec. Although not shown here, this pulse was also on the other stations to the west and

southwest of the fault rupture [13]. Such a pulse is often associated with near-fault, fault normal motions due to directivity. We emphasize that this station is not near the fault, nor is the north-south direction normal to the fault (in fact, it is more nearly parallel to the rupture planes). In addition, the azimuth to the station relative to the direction of fault rupture is such that directivity should have little effect on the motion. Because this large pulse is on the transverse component and in view of the very small motion in the radial direction, we are confident that this motion represents essentially pure  $SH$  waves radiated from the earthquake. The path to the station traverses the Mojave Desert, with a thin veneer of sediments, and therefore effects of near-surface structure are unlikely to have affected the motion at periods controlling the displacement waveform. No pre-event samples were obtained for the data recorded at station 530, but the similarity of the waveforms with other nearby stations for which pre-event samples were available suggests that nothing essential was lost in the record.

In contrast, more than 10 sec of pre-event samples were obtained for the recording at station HEC. More importantly, station HEC is close enough to the faults that the ground motion should include significant residual displacement due to the dislocation across the fault surfaces (these displacements are estimated from InSAR satellite data analyzed by Y. Fialko, personal communication, 2001, to be about  $29\mathrm{cm}$  to the southwest). The north-south component (which, if anything, is a fault-parallel component) has a large pulse in displacement, but we chose instead to study the east-west component because it differs substantially in character from the north-south component at station 530, thus providing a wider range of waveforms for our study of the effect of filter types and corner periods on the elastic and inelastic response spectra.

# EFFECT OF BASELINE CORRECTIONS ON ELASTIC AND INELASTIC DISPLACEMENT RESPONSE SPECTRA

Before presenting results for various filters, we take the opportunity to study the effect of various baseline corrections, without filtering, on the near-fault motion obtained at station HEC. As shown in Boore et al. [13], a number of baseline correction schemes result in displacement waveforms that appear realistic in that the dynamic shaking is followed by a more-or-less constant residual displacement. Unfortunately, the level of the residual displacement can be a sensitive function of the baseline correction parameters, particularly for the east-west component. This is shown in Figure 3, which displays the displacements from the three acceleration time series that we have analyzed. We have chosen the processing to span a range of residual displacements, from essentially no residual to residual displacements in opposite directions. Note that none of the residual displacements are close to the independently derived estimate from InSAR satellite observations—for this reason we do not endorse a particular correction, but only use them to illustrate the sensitivity of the response spectra to the various corrections. The displacements on the north-south component are less sensitive to the baseline correction scheme and are in better agreement with the estimate from InSAR measurements.

In both this and a following section, we compute inelastic response using the program Utility Software for Earthquake Engineering (USEE, developed by M. Aschheim, D. Abrams, and E. Bretz for the Mid-America Earthquake Center, and available at no cost from http://mae.ce.uiuc.edu/usee/; we checked some of the results using the program NSPECTRA from

![](images/cfb33762d60b0f615e462de6819256aeedc7a3f3b2e996a5f8e48ced0ca758f0.jpg)  
Figure 3. HEC for various types of baseline processing (see Boore et al. [13] for details). No filtering was used in the processing. Analysis of InSAR satellite data provided the estimate of co-seismic ground displacement (Y. Fialko, personal communication, 2001).

http://civil.eng.buffalo.edu/nspectra/). We show results for an elastoplastic force-deformation curve (we also used bilinear models with positive post-yielding stiffness, with similar results). The elastoplastic oscillator is used because it is well accepted and is used as a benchmark in almost all studies related to non-linear deformation demand on simple structures. Elastoplastic behavior is generally used to represent the non-degrading hysteretic behavior for both multi- and single-degree-of-freedom systems. For example, it can represent the inelastic behavior of steel moment frames with compact members and no joint fracture. It is also used in many simplified non-linear methods that estimate the maximum inelastic deformation demand on non-degrading SDOF systems; these methods are important tools for the simplified non-linear seismic analysis procedures in performance-based seismic engineering. We show results for a strength reduction factor  $R$  (ratio of the elastic to the yield strength of the oscillator) equal to 3.0; results were also computed for  $R = 1.5$  and  $R = 5.0$ , with similar conclusions. We computed constant displacement ductility spectra as well, but found that they had discontinuities (due to multiple values of the strength reduction factor for the target value of ductility; Inel et al. [15] studied this in some detail). For this reason we have chosen to show spectra for constant strength reduction. Another possible advantage of using the constant  $R$  spectra is that it does not limit the inelastic displacement and thus may better reveal drawbacks of the method of filtering. The essential conclusions are not affected by the type of inelastic spectra used.

The elastic and inelastic spectra are shown in Figure 4. This figure also shows the ratio of the spectra, using as a reference the baseline scheme that resulted in the least residual

![](images/fb7f4ab87e049c39d53c6f190926d7def15c9ef46672d0a2af2da4b992c7c10b.jpg)

![](images/86f9d53b71636849ff339df68bc440008dd26c3517500866c18712e04bc67296.jpg)

![](images/801e3f9a2d239ae13f0bebf9573aa49e013388dcbf403633b7974cd40de1fbbe.jpg)  
Period (sec)

![](images/e79d3e6b0827ec3ffb07c138ea06abea33df8757b71217f8a8d393cd8db458d6.jpg)  
Period (sec)  
Figure 4. Spectra and spectral ratios for HEC (using quad fit as reference). The legend for the ratios is somewhat cryptic, but it should be clear that  $t_2 = 15 / \mathrm{quad}$  means that the response spectrum obtained from the acceleration processed using  $t_2 = 15$  was divided by the response spectrum from the acceleration processed using the 'quad' baseline correction (see Boore et al. [13] for an explanation of the baseline corrections). Results for elastic and inelastic oscillators are shown in the left and right columns, respectively. The accelerations used to drive the oscillators were not filtered.

displacement (what we term the 'quad' scheme, because it is based on fitting a quadratic polynomial to the velocity time series—see Boore et al. [13]). The figure shows that the processing scheme can influence the motions at periods less than about 10 sec, and that the sensitivity is greater for the inelastic than for the elastic spectra. Chopra and Lopez [1] also conclude that the type of baseline correction can have a large influence on the long-period motions.

# EFFECT OF FILTERING ON DISPLACEMENT TIME SERIES

A major concern of this paper is the sensitivity of elastic and inelastic displacement response to the type of filter and to the corner periods of the filters, particularly for oscillator periods much less than the corner periods of the filters. Before showing the response spectra, however, we first describe the characteristics of the filters and discuss the dependence of the displacement time series on the type of filter and the values of the corner periods. We consider two types of filter: causal and acausal Butterworth filters. Acausal filtering is done by running a time-domain causal filter forwards and backwards through the time series, with the number of poles of the causal filter chosen so that the filter responses of both the causally and acausally filtered data are the same at long periods (in our examples the long-period responses go as  $T^{-4}$ ). The time-domain impulse responses and the amplitude and phase spectra are shown in Figure 5 for the filters considered in this paper. The essential difference in the filters is that the causal filter will produce no precursory motion when applied to a time series, but at the expense of a significant distortion in the phase of the time series. Furthermore, the phase distortion is highly dependent on the corner period of the filter, and the distortion is relatively broadband. If the ground motion has much spectral content within several multiplicative factors of the corner period, then there should be significant differences when processed using causal filters with different corner periods. On the other hand, if the spectral content is limited to periods much less than the corner period, then the difference between causal and acausal filters should decrease with increasing corner periods of the filters. These predictions based on the character of the phase responses shown in Figure 5 will be borne out in subsequent figures.

The displacements resulting from the filtered accelerations are shown in Figure 6. The left column shows results for the causal filter, and the right for acausal filters. In applying the filters we followed the guidance of Converse and Brady [12] in adding pre- and post-event pads of sufficient length to allow for the filter response, starting at the first and last zero crossings of the recorded motions to avoid steps. The transient earthquake motion has subsided enough for padding with zeros after the event to be a reasonable procedure, and because pre-event motion is available, no assumptions are needed in adding pre-event zeros. Because on physical and observational grounds the earthquake motion is a transient with a finite duration, the acceleration time series is effectively known for as long a time as necessary to perform filtering, and there is no inconsistency in filtering at periods long compared to the finite duration of the recording (if in doubt about this, consider an accelerometer composed of a single cycle of a sine wave; that motion will have a step in displacement, but the accelerometer can be filtered at arbitrarily long periods by adding zeros as indicated). Only the large-amplitude portions of the waveforms are shown in Figure 6 to allow better comparison of the waveforms resulting from the filtering. As expected, the causal filters produce no precursory filter transients, but the waveforms are quite dependent on the filter corner periods, particularly for the motion recorded at station 530. The waveforms from the acausal filters have just the opposite characteristics, with large precursory transients, but rather similar waveforms. (As a side note, we were accurate in describing the displacements shown in Figure 6 as being derived from filtered accelerations, but the process of filtering and integration is independent of the order in which the operations are performed if adequate pads have been used, and we could equally well have described the displacement time series as resulting from filtering of a doubly integrated, unfiltered acceleration time series. More briefly, we could refer to this as a 'filtered displacement time series'.)

![](images/f72ea6765c653f5f67624de7fc9fa3d12e49dd3305da4976625bdf1ab6548073.jpg)

![](images/5e536638f5ded850c5acf844608c061ef54f7d187c200ff587d61aa4be97b598.jpg)

![](images/dcaa64aa780a4635f6345f1c104baddb3d997813905ba44deca064e3ec49e326.jpg)  
Figure 5. Results of filtering an impulse with amplitude of 256 with both causal and acausal filters, with corner periods of 200, 100, 50, and 25 sec. Time-domain responses as well as the Fourier amplitude and phase spectra are shown. The time series for the causal filters have been shifted to the left, compared to the location of the responses for the acausal filters, in order to capture most of the tails of the responses. Note that the time-domain impulse responses shown in the top row are plotted at a greatly expanded scale to show details; the responses are actually dominated by impulses of amplitude 256. The legend for corner periods  $(T_{c})$  shown in the upper left plot is the same for all plots. The plots of the amplitude and phase responses combine both the causal and acausal filter responses; the acausal responses are plotted using gray lines. The phase spectra have been corrected for the linear phase due to placing the impulse at a time not equal to 0.0, and the corrected phase spectra have been normalized by dividing by  $\pi$ . Note the large phase shifts for the causal filters, even for periods away from the corner periods, and the difference in the phase shifts for the different filters. In contrast, the phase shifts for the acausal filters are zero.

![](images/7bca36106fe43dade4d9f26ed649dd81cbd2f853f12c99580199f53089b2fcd2.jpg)

![](images/ee8e86c564da79bc04e9d76f4d53981d19921f041fde8a5abbe26689a292c34a.jpg)  
Figure 6. Displacements obtained by integrating accelerograms processed with a series of causal and acausal filters for both stations HEC and 530. The left-hand and right-hand columns contain results from records processed using causal and acausal filters, respectively. The legend relating the line type to the corner period of the filter is the same for all plots. The causal filters are 4th order Butterworth filters, and the acausal filters are produced by passing the time series in opposite directions through two 2nd order Butterworth filters (so that the roll-off at long periods is the same for both filters). Pre-event zero pads have been added to the accelerations at both stations, although this was necessary only for the acausally filtered data. Because of the added pads, the time axis for the causally filtered waveforms have been shifted relative to that shown in Figure 2.

Some insight into the sensitivity of the displacement waveforms to the filters can be obtained by considering the apparent period content of the dominant part of the waveforms. From Figure 6, the dominant period for the HEC displacements appears to be less than 10 sec, whereas the more pulse-like motion on the 530 record has a peak-peak period near 20 sec. The Fourier displacement spectra for the unfiltered motions are shown in Figure 7. To emphasize the relative shape, the spectra have been normalized so as to be similar near periods of 1 sec. It is

![](images/128686f0c8e5ce604922fda2d03efcabe7a72bfec6399a71cd1dbc67903bf5f7.jpg)  
Figure 7. Fourier displacement for the unfiltered records from stations 530 and HEC, normalized to be similar near a period of 1 sec to emphasize the relative shape of the spectra.

clear that the 530 record has a relatively large amount of motion near the 25 sec corner period used for the filter, and therefore the record processed using a 25 sec causal filter should be quite different in shape than when processed using causal filters with longer period corners. This is apparent from Figure 6 but, to make the case in a different way, in Figure 8 we compare directly the causal and acausal results for a single corner period in each panel. The acausal displacements are similar in shape for the various filter corner periods, but the causally filtered displacements show a pronounced change in waveform as the filter corner period is decreased. For a very long corner period, the displacement waveform is similar in shape to that obtained from an acausal filter (as expected from the nature of the phase response shown earlier), but this similarity degrades rapidly as the filter corner period is decreased. The change in shape for the HEC record (easily assessed from Figure 6 and not replotted here) is much smaller, because the dominant period of the main part of the motion is less than 10 sec; the waveform of the HEC displacement time series changes significantly if smaller corner periods are used (we do not show this here, but applying a 5 sec filter confirmed this statement).

# EFFECT OF FILTERING ON ELASTIC AND INELASTIC DISPLACEMENT RESPONSE SPECTRA

The elastic and inelastic response spectra corresponding to the filtered acceleration time series are shown in Figure 9 for station HEC. The left and right columns correspond to causal and acausal filters, respectively. The elastic response spectra are given in the first row, and the inelastic response spectra are given in the second row. For both the elastic and the inelastic spectra, there is much less sensitivity to the filter corner period for the acausally filtered

![](images/f96590e647ce6aaf2ddced6d88e645430f3eeaa4975ea477bff168fd7e530e3f.jpg)

![](images/217927d67fd92036e56ba5baa527e2a3d753453a71ddfb66fe30cfb0d1777c84.jpg)

![](images/b7892330598f6bd6f963e3c1c5477bf88375ae425ad8d338478051447522d554.jpg)  
Figure 8. Direct comparison of records from station 530 filtered using acausal and causal filters (the same traces are shown in Figure 6, but comparing the results of different types of filtering rather than different corner periods for the same type of filter).

![](images/3e8cc0c1a9612cb0c239df3e1899593fc783666a75a4881a9b4fe826de038a9b.jpg)

accelerations than for the causally filtered motions. For both types of filters, the inelastic spectra are more sensitive to the corner periods than are the elastic spectra. These comparisons are better shown by the ratios of spectra (Figure 10). We have used the accelerograms obtained using a filter corner of 200 sec as the reference. The widths of the lines in Figure 10 are proportional to the corner periods of the filters. It is important to note that the differences between the inelastic spectra from causally filtered data can exceed a factor of 1.3 for periods much smaller than the corner periods used in the filtering (the smallest corner period was 25 sec) (these excursions are for narrow ranges of periods, however).

The results for station 530 are shown in Figures 11 and 12, using an identical presentation to that used in Figures 9 and 10 for station HEC. Here the inelastic responses corresponding

![](images/f5df97db466210bde6fff2162d9c0fd871621cc5a173dfaf8020d286553e01f1.jpg)

![](images/b5f0629367cb16244b1fbe0f0d0ebfbb4a7cfdd9a9e63aa9d5dadd6ac87d5dd7.jpg)

![](images/0297007042e0ececc915945fdbfd5f9b6c32c2e09df3a7d2ffe85b274ba61f07.jpg)  
Figure 9. Elastic and inelastic  $5\%$  -damped displacement response spectra for the recordings at station HEC, filtered using causal and acausal filters. The dashed line (for a corner period of 200 sec) was the reference spectra for the ratios shown in the next figure.

![](images/99bf99faac336ba2533bed1ac7bbcdcd6465a87730a062c636e470ffef5f7623.jpg)

to the causally filtered acceleration time series show much more sensitivity to the filter corner periods than they did for station HEC. This is similar to the pattern seen in the shapes of the displacement waveforms, and probably for the same reason: phase distortions produced by the causal filtering. To try to gain some understanding of the substantial differences in inelastic response spectra for causally filtered records, even for oscillator periods much less than the filter corner periods, we show in Figure 13 the relative displacement of a 3 sec inelastic elastic-perfectly plastic oscillator, with  $R = 3$ , as a function of time, driven by accelerations filtered using causal filters with corner periods of 200 sec and 25 sec. The oscillator response for the 200 sec filter shows a distinct local shift in the quasi-equilibrium position of the oscillator at around 28 to 29sec. The oscillator driven by acceleration filtered with the 25sec causal

![](images/7a636d8e86621938813d7d70043abd11159b498c0c7332053af957c9fa686092.jpg)

![](images/109e41416ab4c506d90ada2ad136a7e69cfccd5cf0d483f709c3bbeacefeaf83.jpg)

![](images/bddfa26910172cab43fc1e836e2c72bb153cb4129a89a46171a9561788484b9d.jpg)  
Period (sec)

![](images/cfa4fe9ffb8494614322d570ad2dfacd24baedf30331885af3943a38eba172fa.jpg)  
Period (sec)  
Figure 10. Ratios of response spectra for station HEC. The legend for the ratios is somewhat cryptic, but it should be clear that 'R025/200' means that the response spectrum obtained from the acceleration time series filtered with a corner period of 25 sec was divided by the response spectrum from the acceleration time series filtered with a corner period of 200 sec.

filter also shows a shift in equilibrium position, but the shift is not as large, and the time of the shift is later (around 31 to 32 sec). It is difficult to predict these differences in response from the acceleration time series, which are very similar in shape (but sufficiently different that the velocities and displacements derived from these accelerations are substantially different, as also shown in the figure). The velocity time series, however, seem to show a correlation with the change in quasi-equilibrium position, with the change occurring at a time near that of the peak pulse in velocity. These peaks, of course, correspond to rapid transitions in the displacement time series from peaks to troughs, and vice versa, and as discussed in the previous section, the nature of the displacement time series is strongly controlled by the phase shifts of the causal filters if these shifts are in a period range for which there is energy in the unfiltered motions.

![](images/7a107a8098085b551d9279c2956ff447514390037ad67e98ee49df04e8314eea.jpg)

![](images/f36f5468c740889d7a95879eea91f58a934c8e03068a232a63df4eb171d54002.jpg)

![](images/442ad3d2229a5694a8b7f0629fcc2d30981d4602254895672a69883c1296e508.jpg)  
Figure 11. Elastic and inelastic  $5\%$  -damped displacement response spectra for the recordings at station 530, filtered using causal and acausal filters. The dashed line (for a corner period of 200 sec) was the reference spectra for the ratios shown in the next figure.

![](images/01c287aefb3f548d39ba712c24fc6e4e1206cb40e0097c483cc7892ef03ba6cc.jpg)

So, as for the displacement time series, it perhaps is not unexpected that the inelastic spectra are sensitive to the filter corner periods (although we are still surprised that motions of relatively short-period oscillators are as sensitive as they are to much longer filter corner periods).

# RELATIVE ADVANTAGES AND DISADVANTAGES OF CAUSAL AND ACAUSAL FILTERS

The results from the previous section suggest that filtering should always be done using acausal filters. These conclusions should be given careful consideration, however, for acausal filters do have some disadvantages, primarily related to the pre-event and post-event zero pads

![](images/55a115ea53bca8ae0c92a9648cb507c691fcb30eae2c36b2acb1856fa4e4a273.jpg)

![](images/1377a275261b3e9fa3af3a1b73d2dbafc3d8a041bd4cdbad9744ec35a1ed3e03.jpg)

![](images/7132831064b4f38f2775881a8df94528f859d66da00e2b6223c2c67feef53565.jpg)  
Figure 12. Ratios of response spectra for station 530. The legend for the ratios is somewhat cryptic, but it should be clear that 'R025/200' means that the response spectrum obtained from the acceleration time series filtered with a corner period of 25 sec was divided by the response spectrum from the acceleration time series filtered with a corner period of 200 sec.

![](images/2eabfa5b823a06f72113befbf20629976f204c2bfaf80e2a0b82d84bb6e0d757.jpg)

that need to be added to the records before filtering [12], and the consequent filter transients. This is especially true for records that triggered after the  $P$ -wave arrival (as was the case for all of the analog recordings providing most of the pre-1999 strong-motion data). In spite of various attempts to taper the end portions of the records before padding, the filters can produce large filter transients (some processing schemes even use completely artificial methods to improve the 'look' of these waveforms). Often the zero-padded portions of the filtered accelerations and the velocities and displacements derived from these filtered accelerations have been removed from the data provided to the public (this is true of pre-1999 data provided by the

![](images/85971e72d8a04845660711acd2df58a82ef41b7c61e40f742156869649a91167.jpg)

![](images/508c3e31f450d6c8178f8da990e166d5770adbedf22bcc263bfc05dabcf3de97.jpg)

![](images/a8d9d8a09cf75d478c0885dbc7a274583cb3ae07e2709caf08cf790e27e77bf2.jpg)

![](images/ad7f2c6297807eb357902f4c87795875c33ac61040095219900a2a3746a8a93c.jpg)

![](images/169c5d40e7bf08c0714e555f33eb503db5964d9b227ecf780e09bbceec179df4.jpg)

![](images/ed561c02ba351144eb973fd9c7ea24ea2d1b21599fb5d02320ddca04f51ac105.jpg)

![](images/a2a42d6aa474952b146128cbd24b8a237133bcb0414669733628d011ebc29609.jpg)  
Figure 13. The time series response of inelastic 3 sec elastoplastic oscillator, with  $R = 3$ , (bottom row) and various representations of the motion from station 530 driving the oscillator. The left column and right columns are for records filtered with 200 sec and 25 sec filters, respectively. The first, second, and third rows show acceleration, velocity, and displacement time series.

![](images/fcd5587d8911c0a94e727b41fa9c6b3fd9fd3d73ef4b4923fdaa3aadf8f4a074.jpg)

![](images/d7edc9dc5c9a949bfb5d11527c9cce29a21a11d29f72a350835ed93cb69dd8e5.jpg)  
Figure 14. Displacements obtained by integrating accelerograms from stations 530 and HEC processed with an acausal, 25 sec filter. The black line was obtained from the accelerometer with the leading and trailing pads; the gray line was obtained from the accelerometer obtained by truncating the portion that was padded with leading zeros before filtering. The joins of the pads and the original data are indicated by the short vertical lines.

![](images/b9444cabb73fca8afc2a92939d32a68f0d62a5648b04fdeb36be8c30d152ed23.jpg)

U.S. Geological Survey, at least since 1984). This procedure saves storage space, and was an important consideration before the advent of inexpensive disk storage. The acceleration, velocity, and displacement time series, however, are then no longer compatible, in the sense that straightforward integration of the acceleration time series will not reproduce the velocity and displacement time series that are provided to the public [17, 18]. The difference in displacement waveforms is shown in Figure 14. Shown are the waveforms obtained from the padded data, and those obtained by simply stripping off the portion that was padded from the filtered accelerations, before double integration (to make the point, a bit more was stripped off of the HEC record because it already had some pre-event samples). It is clear that further baseline correction or filtering would be needed to eliminate the long-term trends in the displacements obtained from the shortened records. This is not to say that the velocity and displacement data provided to the public are erroneous; if the processing was done properly, those velocity and displacement time series were obtained with proper consideration of the zero pads. The only way to provide truly compatible data, however, would be to provide the complete time series used in the processing, including the padded portions (which can be a significant fraction of the overall length of the time series, particularly if filters with relatively long corner periods are used).

# SUMMARY AND CONCLUSIONS

Using two digital records, of very different character, from the 1999 Hector Mine, California, earthquake, we found that both the elastic and inelastic response spectra are sensitive to

the corner periods used in causal filtering at periods much shorter than those corner periods. Although not shown here, the same results were found from the analysis of several recordings from other large earthquakes. The effect is more important for inelastic than for elastic response spectra and seems most important for causally-filtered records for which the period content of the major part of the unfiltered motion is within several multiplicative factors of the corner periods of the causal filters. The sensitivity of the results to the filter corner periods is due to the strong phase distortions associated with causal filters. Users of data obtained using causal filters should be wary of these effects. (Recent data from both the USGS and from PEER have been processed using causal filters, although as a result of our study, the USGS is now using acausal filters in its processing.) The question of whether to use causal or acausal filters depends on the intended use of the data, desirability for compatible processed acceleration, velocity, and displacement time series, and considerations of computer storage space. On balance, we think that the advantages of acausal filters outweigh the disadvantages, especially for digital data with pre-event samples.

# ACKNOWLEDGEMENTS

We thank Mark Aschheim for discussions regarding discontinuities in constant ductility spectra. The inelastic spectral calculations were made using program USEE. Reviews by Kent Fogleman and Chris Stephens and two anonymous reviewers significantly improved the paper. The Scientific Research and Technical Council of Turkey is acknowledged for providing financial support to the second author for his postdoctoral stay at Stanford.

# REFERENCES

1. Chopra AK, Lopez OA. Evaluation of simulated ground motions for predicting elastic response of long period structures and inelastic response of structures. Earthquake Engineering and Structural Dynamics 1979; 7:383-402.  
2. Bommer JJ, Elnashai AS. Displacement spectra for seismic design. Journal of Earthquake Engineering 1999; 3:1-32.  
3. Tolis SV, Faccioli E. Displacement design spectra. Journal of Earthquake Engineering 1999; 3:107-125.  
4. Chopra AK, Chintanapakdee C. Comparing response of SDF systems to near-fault and far-fault earthquake motions in the context of spectral regions. Earthquake Engineering and Structural Dynamics 2001; 30:1769-1789.  
5. MacRae GA, Morrow DV, Roeder CW. Near-fault ground motion effects on simple structures. Journal of Structural Engineering (ASCE) 2001; 127:996-1004.  
6. Chiu H-C. Stable baseline correction of digital strong-motion data. Bulletin of the Seismological Society of America 1997; 87:932-944.  
7. Boore DM. Effect of baseline corrections on displacements and response spectra for several recordings of the 1999 Chi-Chi, Taiwan, earthquake. Bulletin of the Seismological Society of America 2001; 91:1199-1211.  
8. Wang G-Q, Boore DM, Igel H, Zhou X-Y. Some observations on colocated and closely-spaced strong ground motion records of the 1999, Chi-Chi, Taiwan earthquake. Bulletin of the Seismological Society of America 2003; 93:674-693.  
9. Trifunac MD. Zero baseline correction of strong-motion accelerograms. Bulletin of the Seismological Society of America 1971; 61:1201-1211.  
10. Trifunac MD, Lee VW. Routine computer processing of strong motion accelerograms. Report No. EERL 73-03, Earthquake Engineering Research Laboratory, California Institute of Technology, Pasadena, 1973.  
11. Converse AM, Brady AG, Joyner WB. Improvements in strong-motion data processing procedures. Proceedings of the 8th World Conference on Earthquake Engineering, San Francisco, vol. II, 1984; 143-148.  
12. Converse AM, Brady AG. BAP - Basic strong-motion accelerogram processing software, Version 1.0. U.S. Geological Survey Open File Report No. 92-296A, Menlo Park, 1992.

13. Boore DM, Stephens CD, Joyner WB. Comments on baseline correction of digital strong-motion data: Examples from the 1999 Hector Mine, California, earthquake. Bulletin of the Seismological Society of America 2002; 92:1543-1560.  
14. Lee VW, Trifunac MD. Automatic digitization and processing of accelerograms using PC. Report 90-03, Department of Civil Engineering, University of Southern California, Los Angeles, 1990.  
15. Inel M, Ascheim MA, Abrams DP. An algorithm for computing isoductile response spectra. Journal of Earthquake Engineering 2002; 6:1-16.  
16. Ji C, Wald DJ, Helmberger DV. Source description of the 1999 Hector Mine, California earthquake; Part II: Complexity of slip history. Bulletin of the Seismological Society of America 2002; 92:1208-1226.  
17. Malhotra PK. Response spectrum of incompatible acceleration, velocity and displacement histories. Earthquake Engineering and Structural Dynamics 2001; 30:279-286.  
18. Malhotra PK. Author's reply to discussion by George Mylonakis and Costis Syngros of 'Response spectrum of incompatible acceleration, velocity and displacement histories' Earthquake Engng Struct. Dyn. 2001; 30:279-286. Earthquake Engineering and Structural Dynamics 2002; 31:1033-1035.