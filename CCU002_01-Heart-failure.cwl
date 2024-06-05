cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  right-ccu002_01-heart-failure---primary:
    run: right-ccu002_01-heart-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  systolic-ccu002_01-heart-failure---primary:
    run: systolic-ccu002_01-heart-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: right-ccu002_01-heart-failure---primary/output
  ccu002_01-heart-failure-assoc---primary:
    run: ccu002_01-heart-failure-assoc---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: systolic-ccu002_01-heart-failure---primary/output
  referral-ccu002_01-heart-failure---primary:
    run: referral-ccu002_01-heart-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-assoc---primary/output
  ccu002_01-heart-failure-malignant---primary:
    run: ccu002_01-heart-failure-malignant---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: referral-ccu002_01-heart-failure---primary/output
  ccu002_01-heart-failure---primary:
    run: ccu002_01-heart-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-malignant---primary/output
  ccu002_01-heart-failure-compensated---primary:
    run: ccu002_01-heart-failure-compensated---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure---primary/output
  ccu002_01-heart-failure-echocardiogram---primary:
    run: ccu002_01-heart-failure-echocardiogram---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-compensated---primary/output
  ccu002_01-heart-failure-fraction---primary:
    run: ccu002_01-heart-failure-fraction---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-echocardiogram---primary/output
  acute-ccu002_01-heart-failure---primary:
    run: acute-ccu002_01-heart-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-fraction---primary/output
  valvular-ccu002_01-heart-failure---primary:
    run: valvular-ccu002_01-heart-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: acute-ccu002_01-heart-failure---primary/output
  chronic-ccu002_01-heart-failure---primary:
    run: chronic-ccu002_01-heart-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: valvular-ccu002_01-heart-failure---primary/output
  ccu002_01-heart-failure-dissent---primary:
    run: ccu002_01-heart-failure-dissent---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: chronic-ccu002_01-heart-failure---primary/output
  rheumatic-ccu002_01-heart-failure---primary:
    run: rheumatic-ccu002_01-heart-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-dissent---primary/output
  ventricular-ccu002_01-heart-failure---primary:
    run: ventricular-ccu002_01-heart-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: rheumatic-ccu002_01-heart-failure---primary/output
  ccu002_01-heart-failure-cardiac---primary:
    run: ccu002_01-heart-failure-cardiac---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: ventricular-ccu002_01-heart-failure---primary/output
  renal-ccu002_01-heart-failure---primary:
    run: renal-ccu002_01-heart-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-cardiac---primary/output
  ccu002_01-heart-failure-benign---primary:
    run: ccu002_01-heart-failure-benign---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: renal-ccu002_01-heart-failure---primary/output
  ccu002_01-heart-failure-pulmonale---primary:
    run: ccu002_01-heart-failure-pulmonale---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-benign---primary/output
  heart---primary:
    run: heart---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-pulmonale---primary/output
  congestive-ccu002_01-heart-failure---primary:
    run: congestive-ccu002_01-heart-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule22
      potentialCases:
        id: potentialCases
        source: heart---primary/output
  hypertensive-ccu002_01-heart-failure---primary:
    run: hypertensive-ccu002_01-heart-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule23
      potentialCases:
        id: potentialCases
        source: congestive-ccu002_01-heart-failure---primary/output
  ccu002_01-heart-failure-first---primary:
    run: ccu002_01-heart-failure-first---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule24
      potentialCases:
        id: potentialCases
        source: hypertensive-ccu002_01-heart-failure---primary/output
  ccu002_01-heart-failure-nurse---primary:
    run: ccu002_01-heart-failure-nurse---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule25
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-first---primary/output
  ccu002_01-heart-failure-second---primary:
    run: ccu002_01-heart-failure-second---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule26
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-nurse---primary/output
  ccu002_01-heart-failure-education---primary:
    run: ccu002_01-heart-failure-education---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule27
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-second---primary/output
  ccu002_01-heart-failure-reporting---primary:
    run: ccu002_01-heart-failure-reporting---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule28
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-education---primary/output
  ccu002_01-heart-failure-monitoring---primary:
    run: ccu002_01-heart-failure-monitoring---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule29
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-reporting---primary/output
  ccu002_01-heart-failure-verbal---primary:
    run: ccu002_01-heart-failure-verbal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule30
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-monitoring---primary/output
  ccu002_01-heart-failure-review---primary:
    run: ccu002_01-heart-failure-review---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule31
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-verbal---primary/output
  patient-ccu002_01-heart-failure---primary:
    run: patient-ccu002_01-heart-failure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule32
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-review---primary/output
  ccu002_01-heart-failure-third---primary:
    run: ccu002_01-heart-failure-third---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule33
      potentialCases:
        id: potentialCases
        source: patient-ccu002_01-heart-failure---primary/output
  ccu002_01-heart-failure-telephone---primary:
    run: ccu002_01-heart-failure-telephone---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule34
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-third---primary/output
  ccu002_01-heart-failure-administration---primary:
    run: ccu002_01-heart-failure-administration---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule35
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-telephone---primary/output
  ccu002_01-heart-failure-referred---primary:
    run: ccu002_01-heart-failure-referred---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule36
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-administration---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule37
      potentialCases:
        id: potentialCases
        source: ccu002_01-heart-failure-referred---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
  inputModule22:
    id: inputModule22
    doc: Python implementation unit
    type: File
  inputModule23:
    id: inputModule23
    doc: Python implementation unit
    type: File
  inputModule24:
    id: inputModule24
    doc: Python implementation unit
    type: File
  inputModule25:
    id: inputModule25
    doc: Python implementation unit
    type: File
  inputModule26:
    id: inputModule26
    doc: Python implementation unit
    type: File
  inputModule27:
    id: inputModule27
    doc: Python implementation unit
    type: File
  inputModule28:
    id: inputModule28
    doc: Python implementation unit
    type: File
  inputModule29:
    id: inputModule29
    doc: Python implementation unit
    type: File
  inputModule30:
    id: inputModule30
    doc: Python implementation unit
    type: File
  inputModule31:
    id: inputModule31
    doc: Python implementation unit
    type: File
  inputModule32:
    id: inputModule32
    doc: Python implementation unit
    type: File
  inputModule33:
    id: inputModule33
    doc: Python implementation unit
    type: File
  inputModule34:
    id: inputModule34
    doc: Python implementation unit
    type: File
  inputModule35:
    id: inputModule35
    doc: Python implementation unit
    type: File
  inputModule36:
    id: inputModule36
    doc: Python implementation unit
    type: File
  inputModule37:
    id: inputModule37
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
