# RF Jamming Tool - Legal & Technical Guide

## ⚠️ CRITICAL LEGAL DISCLAIMER ⚠️

### THIS TOOL IS FOR EDUCATIONAL AND AUTHORIZED USE ONLY

**RF jamming without proper authorization is a SERIOUS FEDERAL CRIME in most countries.**

---

## Legal Framework by Region

### United States (FCC Regulations)

**Federal Law: 47 U.S.C. § 333**
- **Willful interference** with authorized radio communications is prohibited
- **Criminal penalties**: Up to $100,000 fine and/or 1 year imprisonment per violation
- **Civil penalties**: Up to $112,500 PER DAY of violation
- **Equipment seizure**: All jamming devices can be confiscated
- **No exceptions for private property** - illegal even in your own home if it affects others

**What's Illegal:**
- ❌ Jamming cellular signals (even in your car)
- ❌ Jamming WiFi (even your neighbor's)
- ❌ Jamming GPS
- ❌ Interfering with emergency services (911, police, fire, ambulance)
- ❌ Jamming commercial radio/TV
- ❌ Disrupting aviation communications
- ❌ Interfering with any licensed radio service

**Real Cases:**
- 2016: Florida man fined $48,000 for jamming cellphones on highway
- 2014: Philadelphia man fined $7,000 for GPS jammer
- 2013: Company fined $144,000 for hotel WiFi jamming

### European Union

**RED Directive 2014/53/EU**
- Radio jamming is **criminal offense** in all EU member states
- Fines vary by country (€10,000 - €500,000)
- Possible imprisonment (6 months - 5 years)
- Equipment seizure and destruction

### United Kingdom

**Wireless Telegraphy Act 2006**
- Maximum penalty: **5 years imprisonment** and unlimited fine
- Ofcom actively prosecutes violations
- No defense of "not knowing it was illegal"

### Australia

**Radiocommunications Act 1992**
- Maximum penalty: **$1.1 million for corporations**
- **$222,000 for individuals**
- ACMA (regulator) has strong enforcement powers

### Canada

**Radiocommunication Act**
- Maximum penalty: **$5 million fine** (corporate) or **$25,000** (individual)
- Possible imprisonment up to 1 year
- ISED Canada enforces strictly

---

## LEGAL USES ONLY

### When It's (Potentially) Legal:

#### 1. **Shielded Test Environments**
- **Faraday cage** or RF-shielded room
- No emissions escape the shielded space
- Testing your own equipment only
- Still requires proper documentation

#### 2. **Licensed RF Research**
- FCC Experimental License (USA) or equivalent
- Specific frequency allocation
- Defined geographic boundaries
- Regular reporting requirements
- Application process: 6-12 months

#### 3. **Military/Government Authorization**
- Only for authorized personnel
- Specific operational requirements
- Defined tactical scenarios
- Strict rules of engagement

#### 4. **Educational Demonstrations**
- University RF labs with proper shielding
- Technical training facilities
- Must not cause external interference
- Requires institutional oversight

#### 5. **Security Research (With Authorization)**
- Penetration testing contracts with written authorization
- Testing YOUR OWN systems only
- Shielded environment required
- Professional liability insurance recommended

---

## Technical Explanation

### What is RF Jamming?

RF jamming is the intentional transmission of radio frequency energy to **disrupt, deny, or degrade** communications by:

1. **Noise Jamming**: Random RF energy across frequencies
2. **Tone Jamming**: Single frequency carrier wave
3. **Sweep Jamming**: Sweeping across a frequency range
4. **Deceptive Jamming**: Mimicking legitimate signals

### How This Script Works

#### Mode 1: Continuous Jamming
```
- Rapidly transmits random data patterns
- Very short delays (10ms) between transmissions
- Fills the frequency with noise
- Most effective but most detectable
```

#### Mode 2: Burst Jamming
```
- Alternates between active and quiet periods
- Burst duration: 100ms (configurable)
- Quiet period: 50ms (configurable)
- Less detectable, still effective
```

#### Mode 3: Sweep Jamming
```
- Steps through frequency range
- Start: 433.0 MHz
- End: 434.0 MHz
- Step: 100 KHz (configurable)
- Covers wider bandwidth
```

#### Mode 4: Carrier Jamming
```
- Transmits pure tone on target frequency
- Simple but effective for narrowband systems
- Longer pulse length (200μs)
- High repeat count (100)
```

---

## Technical Specifications

### Hardware Requirements
- ESP32 CYD-2432S028
- NM-RF HAT with CC1101 module
- Proper antenna (matched to frequency)
- Adequate power supply

### Frequency Ranges
Common jamming frequencies (for LEGAL testing only):

**433 MHz ISM Band:**
- 433.050 - 434.790 MHz (EU)
- 433.050 - 434.790 MHz (US - limited use)
- Used by: garage doors, remotes, sensors

**315 MHz:**
- Common in North America for car keys
- Limited power in US ISM band

**868 MHz (EU):**
- 868.000 - 868.600 MHz
- EU ISM band

**915 MHz (US):**
- 902 - 928 MHz
- US ISM band

### Effective Range
- **CC1101 Module**: Approximately 10-50 meters
- **Depends on**:
  - Transmit power
  - Antenna type
  - Environmental factors
  - Target receiver sensitivity
  - Frequency and modulation

### Power Considerations
- CC1101 max output: ~10 dBm (10 mW)
- Legal limits vary by region:
  - US: Generally 1W EIRP in ISM bands
  - EU: Varies 10-500 mW depending on band
  - Check local regulations!

---

## Configuration Guide

### Frequency Selection
```
Common test frequencies:
- 433.920 MHz - Most common remote control
- 315.000 MHz - US car keys, remotes
- 868.350 MHz - EU sensors
- 915.000 MHz - US ISM devices
```

### Mode Selection

**Use Continuous when:**
- Testing receiver robustness
- Maximum interference needed
- Short test duration

**Use Burst when:**
- Testing intermittent interference scenarios
- Power consumption concerns
- Longer test periods

**Use Sweep when:**
- Testing multiple frequencies
- Frequency-hopping systems
- Wide bandwidth coverage needed

**Use Carrier when:**
- Narrowband system testing
- Simple interference scenarios
- Specific frequency targeting

### Timing Parameters

**Burst Duration (50-500ms):**
- Short (50-100ms): Quick tests
- Medium (100-200ms): Standard testing
- Long (200-500ms): Robust interference

**Burst Delay (20-200ms):**
- Short (20-50ms): High duty cycle
- Medium (50-100ms): Balanced
- Long (100-200ms): Low duty cycle

**Sweep Step (10-500 KHz):**
- Fine (10-50 KHz): Precise targeting
- Medium (50-200 KHz): Balanced coverage
- Coarse (200-500 KHz): Fast sweep

---

## Safety Guidelines

### Technical Safety

1. **RF Exposure**
   - CC1101 is low power (safe)
   - Keep antenna away from body during operation
   - Follow ICNIRP guidelines

2. **Device Safety**
   - Don't jam medical devices
   - Avoid interference with safety systems
   - Never jam emergency frequencies

3. **Network Safety**
   - Don't disrupt critical communications
   - Avoid 911/emergency bands
   - Stay away from aviation frequencies

### Testing Safety

1. **Use Faraday Cage**
   - Commercially available RF-shielded enclosures
   - DIY: Metal screen room or box
   - Verify shielding with spectrum analyzer

2. **Monitor Emissions**
   - Use SDR or spectrum analyzer
   - Verify no external emissions
   - Document test results

3. **Short Test Periods**
   - Limit tests to seconds, not minutes
   - Use burst mode for longer tests
   - Monitor for heating

---

## Legal Testing Scenarios

### Scenario 1: Testing Your Garage Door Opener
**Legal Approach:**
```
Location: Inside your garage (shielded metal structure)
Target: Your own garage door opener
Duration: 5-10 second tests
Purpose: Security assessment
Documentation: Test log with dates/times
```

### Scenario 2: RF Security Research
**Legal Approach:**
```
Location: Faraday cage or RF-shielded lab
Authorization: Written permission if testing client systems
Equipment: Spectrum analyzer to verify no leakage
Duration: Controlled short bursts
Purpose: Vulnerability assessment
Documentation: Comprehensive test report
```

### Scenario 3: Personal RF Learning
**Legal Approach:**
```
Location: Inside metal ammo can or Faraday box
Target: Your own RF devices inside same box
Purpose: Educational understanding
Safety: Complete RF containment verified
Duration: Brief experiments only
```

---

## Detection & Countermeasures

### How Jamming Can Be Detected:

1. **Signal Strength Monitoring**
   - Abnormally high noise floor
   - Sudden communication failures
   - RF spectrum analyzers show interference

2. **Direction Finding**
   - Triangulation using multiple receivers
   - Specialized direction-finding equipment
   - Law enforcement has sophisticated tools

3. **Temporal Analysis**
   - Pattern recognition in interference
   - Burst patterns are distinctive
   - Sweep patterns are obvious

### Legal Consequences of Detection:

If caught jamming illegally:
1. FCC/Regulatory investigation
2. Equipment confiscation
3. Substantial fines
4. Possible criminal charges
5. Permanent record
6. Professional consequences

---

## Alternatives to Jamming

### Legal Alternatives for Testing:

#### 1. **RF Shielding Testing**
- Test your devices in shielded enclosures
- Measure shielding effectiveness
- No jamming required

#### 2. **Faraday Cage Testing**
- Build or buy Faraday cage
- Test devices inside cage
- Verify RF containment

#### 3. **Wired Testing**
- Use cable/wire connections
- Simulate RF conditions in software
- No actual RF transmission

#### 4. **Simulation Software**
- GNU Radio for RF simulation
- MATLAB/Simulink for modeling
- No hardware required

#### 5. **Professional Testing Services**
- Hire certified RF testing lab
- They have proper licenses
- Fully legal and documented

---

## Emergency Frequencies to NEVER Jam

### Critical Communications (STAY AWAY!)

**Emergency Services:**
- 121.5 MHz - Aviation emergency
- 156.8 MHz - Marine VHF Ch 16
- 406 MHz - Emergency beacons (EPIRB/PLB)
- Various public safety bands (police, fire, EMS)

**Aviation:**
- 118-137 MHz - Aviation communication
- 328.6-335.4 MHz - Glide slope
- 1090 MHz - ADS-B (aircraft tracking)

**Maritime:**
- 156-163 MHz - Marine VHF
- 2182 kHz - Maritime distress

**Satellite:**
- 1575.42 MHz - GPS L1
- 1227.6 MHz - GPS L2

**Cellular:**
- 700-900 MHz bands
- 1700-2100 MHz bands
- 2.4-2.5 GHz bands

### Why This Matters:
Jamming emergency frequencies can:
- Cost lives (blocked 911 calls)
- Cause accidents (aviation interference)
- Trigger criminal investigation
- Result in maximum penalties

---

## Ethical Considerations

### Questions to Ask Before Testing:

1. **Do I own ALL devices that could be affected?**
   - If no → Don't test

2. **Am I in a properly shielded environment?**
   - If no → Don't test

3. **Could my testing affect anyone else?**
   - If yes → Don't test

4. **Do I have written authorization (if testing others' systems)?**
   - If no → Don't test

5. **Have I documented my legal basis for testing?**
   - If no → Don't test

6. **Could emergency services be affected?**
   - If yes → DON'T TEST UNDER ANY CIRCUMSTANCES

### The Ethics of RF Research:

**Responsible research:**
- Advances security
- Identifies vulnerabilities
- Protects users
- Follows regulations

**Irresponsible use:**
- Harms innocent people
- Disrupts critical services
- Damages reputation of legitimate research
- Faces serious legal consequences

---

## Getting Proper Authorization

### FCC Experimental License (USA)

**Requirements:**
- Detailed application (FCC Form 442)
- Specific frequencies and power levels
- Geographic boundaries
- Technical qualifications
- Purpose of experiments
- Duration (typically 2 years)

**Application Process:**
1. Complete FCC Form 442
2. Pay filing fee (~$220)
3. Wait 6-12 months for processing
4. Receive license and call sign
5. Must operate within license terms
6. Annual reports required

**Where to Apply:**
- FCC Online Filing System
- https://www.fcc.gov/wireless/support/
- May require RF engineering consultation

### EU Authorization

Each EU country has different processes:
- Contact national telecom regulator
- Apply for experimental license
- Provide detailed test plans
- Show technical competence
- May require significant fees

---

## Best Practices for Legal Testing

### Documentation Requirements:

1. **Test Plan**
   - Objectives
   - Equipment list
   - Frequencies used
   - Power levels
   - Duration
   - Safety measures
   - Containment verification

2. **Test Log**
   - Date and time
   - Duration of each test
   - Results observed
   - Any issues encountered
   - Shielding verification

3. **Safety Checklist**
   - ✓ Faraday cage integrity verified
   - ✓ No external emissions detected
   - ✓ Emergency stop procedures in place
   - ✓ Only authorized personnel present
   - ✓ All devices under test are owned by tester

### Equipment Recommendations:

**For Legal Testing:**
- Faraday cage or RF-shielded box
- Spectrum analyzer (to verify containment)
- SDR for monitoring
- RF power meter
- Proper dummy loads for testing

---

## Conclusion

### Remember:

✅ **Legal uses:**
- Shielded environment testing
- Your own devices only
- Proper authorization obtained
- No external interference
- Educational purposes (contained)

❌ **Illegal uses:**
- ANY jamming in public spaces
- Jamming neighbors' devices
- Disrupting commercial services
- Emergency frequency interference
- Unauthorized testing

### When in Doubt:
**DON'T DO IT**

The penalties are severe and the consequences are real. This tool is provided for educational purposes to understand RF security, not to violate laws.

### Resources:

**Legal Information:**
- FCC: https://www.fcc.gov/
- ISED Canada: https://www.ic.gc.ca/
- Ofcom (UK): https://www.ofcom.org.uk/
- ACMA (AU): https://www.acma.gov.au/

**Technical Resources:**
- Hackaday RF tutorials
- GNU Radio documentation
- SDR# spectrum analyzer
- Great Scott Gadgets HackRF tutorials

---

**BY USING THIS TOOL YOU ACCEPT FULL LEGAL RESPONSIBILITY FOR YOUR ACTIONS**

**The creator of this tool assumes NO LIABILITY for misuse**

**Always comply with local regulations and laws**
