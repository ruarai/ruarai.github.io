#set page(paper: "a4")

#set text(font: "TeX Gyre Pagella", size: 10pt)

#import "automation.typ": papers-rows, talks-rows

#set table(
  columns: (1.0fr, 4fr),
  align: (left, left,),
  stroke: none,
  inset:8pt,
)

#show link: set text(blue)

#table(
  [*Ruarai Tobin*], [ruarait\@student.unimelb.edu.au],
  table.hline(),
  [], [School of Mathematics and Statistics \
       The University of Melbourne \
       Melbourne, Australia]
)

#table(
  table.cell(colspan: 2)[*Education and appointments*],
  table.hline(),
  [Oct 2023 -- _ongoing_], [PhD Candidate, The University of Melbourne \ Melbourne Research Scholarship],
  [Mar 2021 -- Oct 2023], [Research Assistant, The University of Melbourne],
  [2017 -- 2020], [Bachelor of Science, _Computational Biology_, The University of Melbourne],
)

#table(
  [*Publications*], [],
  table.hline(), 
..papers-rows
)

#table(
  [*Awards*], [],
  table.hline(),
  
  [2022], [Best Research With Significant Policy Impact Award: COVID-19 national situational assessment (McCaw JM, Shearer FM, Price DJ, Moss R, *Tobin RJ*, Golding N, Ryan G, Hao A, Babu A, Duncan D), Melbourne School of Population and Global Health, The University of Melbourne]
)

#table(
  table.cell(colspan: 2)[*Invited presentations*],
  table.hline(),
  
  [2026], [*Tobin RJ*, Eales O, McCaw JM, Shearer FM. Improving respiratory virus forecasts by capturing the effect of school holidays at the _Centre for Mathematical Modelling of Infectious Diseases, LSHTM_ Spoken presentation. (August 27th 2026, London, United Kingdom)],
  [2023], [Adekunle A, Lee H, Dawson P, *Tobin RJ*, Kim Y. Forecasting COVID-19 in Australia and South Korea at the Nonlinear Dynamics and Mathematical Application Conference (NDMAC). Panel discussion. (August 26th 2023, Busan, Korea)],
)
\


#table(
  [*Presentations*], [_Presenting author only_],
  table.hline(),

  ..talks-rows
)


#table(
  table.cell(colspan: 2)[*Commissioned research reports*],
  table.hline(),

  [May 2021 -- Dec 2023], [Situational assessment of COVID-19 in Australia. Weekly reports prepared for National Cabinet, the Communicable Diseases Network of Australia and the Australian Health Protection Principal Committee. *Contributing member*, providing COVID-19 case incidence forecasts May 2021 -- November 2021 and hospital bed occupancy forecasts December 2021 -- December 2023; #link("https://doi.org/10.26188/24845328.v3")[10.26188/24845328.v3];],

  [Mar 2022 -- Jul 2023], [*Tobin RJ*, Walker C, McCaw JM, Price DJ, Shearer FM. Forecasts of COVID-19 hospital bed and ICU occupancy, prepared on a weekly basis for the New South Wales Ministry of Health.],

  [Nov 2022], [Zachreson C, Walker C, Conway E, *Tobin RJ*, Shearer FM, McVernon J, Geard N. COVID-19 outbreak response in Residential Aged Care Facilities (RACFs) -- Simulation study on the effects of asymptomatic testing and outbreak response delays.],

  [Jan 2022], [*Tobin RJ*, Wood JG, Jayasundara D, Sara G, Walker CR, Martin G, McCaw JM, Shearer FM and Price DJ. Rapid response statistical analysis of length of stay for hospitalised COVID-19 patients during the Omicron SARS-CoV-2 variant of concern epidemic, summary reporting delivered to New South Wales Health and the Communicable Diseases Network of Australia (CDNA).],

  [Dec 2021], [Lydeamore M, Ryan G, *Tobin RJ*, August H, Golding N, Price DJ, Shearer FM, McCaw JM. Early outbreak situational awareness during the emergence of the Omicron SARS-CoV-2 variant of concern in New South Wales.],

  [Nov 2021], [Lydeamore M, *Tobin RJ*, Zachreson C, Ryan GR, Wood J, Golding N, Shearer FM, McCaw JM, McVernon J, Geard N. National Plan to transition Australia’s National COVID Response, local government area substream.],

  [Jun -- Jul 2021], [*Tobin RJ*, Shearer FM, Price DJ, McVernon J. Situational assessment reports for COVID-19 in Fiji, delivered to Fiji Ministry of Health and Medical Services, and WHO Western Pacific Regional Office.],

  [Apr 2021], [*Tobin RJ*, Harrison LE, Price DJ, Flegg JA, Shearer FM. Updating the spatial distribution of _Plasmodium knowlesi_ zoonotic malaria transmission risk in Indonesia, with summary reporting provided to the Indonesian Ministry of Health.],
)

#table(
  [*Media*], [],
  table.hline(),
  [2024], [(Interviewed for) From macaque to man: the growing threat of zoonotic malaria. _GAVI VaccinesWork_ #link("https://www.gavi.org/vaccineswork/macaque-man-growing-threat-zoonotic-malaria")[(online)].],
)
#table(
  [*Service*], [],
  table.hline(),
  
  table.cell(colspan: 2, align: left)[*Committee Membership*],
  [Apr 2025 -- _ongoing_], [Forecasting infrastructure software lead, Australian--Aotearoa Consortium for Epidemic Forecasting & Analytics (ACEFA).],
  [Sep 2024], [Organising committee, SPECTRUM annual meeting 2024.],
  
  table.cell(colspan: 2, align: left)[*Peer Review*],
  table.cell(colspan: 2,)[
    Royal Society Interface \
    PLOS Computational Biology \ 
    Journal of Open Source Software \ 
    BMC Public Health \ 
    Epidemics
  ],
  table.cell(colspan: 2, align: left)[*Affiliations*],
  table.cell(colspan: 2,)[
    Australia and New Zealand Industrial and Applied Mathematics (ANZIAM) \ 
    Australian Mathematical Society (AustMS) \ 
    International Society for Respiratory Viruses (ISRV) \
    Public Health Association of Australia (PHAA) \ 
    Statistical Society of Australia (SSA) \ 
  ],
)

#table(
  table.cell(colspan: 2)[*Grants and Funding*],
  table.hline(),
  
  // [Jul 2026], [ARDC ... _Competitive travel grant_. (AUD \$4,934).],
  [Apr 2026], [Maurice Belz Travel Scheme (unredeemed). _Competitive travel grant_. (AUD \$4,934).],
  [Apr 2026], [University of Melbourne Science Abroad Travelling Scholarship (SATS). _Competitive travel grant_. (AUD \$2,000).],
  [Feb 2022], [Lydeamore MJ, *Tobin RJ*, Ampt F, Alpren C, Price DJ. Analysis of spatial heterogeneity in mobility and COVID-19 transmission in the Western Suburbs of Melbourne. _SPECTRUM-SPARK Seed Funding Scheme 2022_. (AUD \$19,000).],
  [May 2022], [Zachreson C, Walker CR, Conway E, *Tobin RJ*, Shearer FM, McVernon J, Geard N. Analysis and modelling of COVID-19 outbreaks and response measures in Residential Aged-Care Facilities. _Australian Government Department of Health and Aged Care contract_ (AUD \$239,000).],
)



