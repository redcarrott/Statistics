dat <- anes_timeseries_2020_csv_20210719

dat <- dat %>% 
  rename(
  id_2020 = 'V200001',
  mode_of_interview = 'V200002',
  eligibility_concern_flag = 'V200005',
  presidential_preference = 'V201075x',
  presidential_candidate_intent = 'V201033',
  presidential_candidate_preference = 'V201036',
  presidential_candidate_intent_strength = 'V201034',
  presidential_candidate_preference_strength = 'V201037',
  presidential_candidate_preference_yn = 'V201035',
  house_preference = 'V201076x',
  senate_preference = 'V201077x',
  governor_preference = 'V201078x',
  voting_liklihood = 'V201100',
  vote_in_2016__yn_v1 = 'V201101',
  vote_in_2016_yn_v2 = 'V201102',
  vote_in_2016 = 'V201103',
  vote_in_2012 = 'V201105',
  party_pre = 'V201018',
  party_post = 'V202064',
  difficulty_voting = 'V202120a',
  difficulty_w_id_card = 'V202120b',
  difficulty_obtaining_absentee_ballot = 'V202120c',
  confusion_about_ballot_or_machine = 'V202120d',
  difficulty_getting_to_poll = 'V202120e',
  long_wait_times = 'V202120f',
  work_schedule = 'V202120g',
  bad_weather = 'V202120h',
  difficulty_mailing = 'V202120i',
  difficulty_other = 'V202120j',
  difficulty_none = 'V202120k'
)

dat <- dat %>% select(
  id_2020,
  mode_of_interview,
  eligibility_concern_flag,
  presidential_preference,
  presidential_candidate_intent,
  presidential_candidate_preference,
  presidential_candidate_intent_strength,
  presidential_candidate_preference_strength,
  presidential_candidate_preference_yn,
  house_preference,
  senate_preference,
  governor_preference,
  voting_liklihood,
  vote_in_2016__yn_v1,
  vote_in_2016_yn_v2,
  vote_in_2016,
  vote_in_2012,
  party_pre,
  party_post,
  difficulty_voting,
  difficulty_w_id_card,
  difficulty_obtaining_absentee_ballot,
  confusion_about_ballot_or_machine,
  difficulty_getting_to_poll,
  long_wait_times,
  work_schedule,
  bad_weather,
  difficulty_mailing,
  difficulty_other,
  difficulty_none
)


democrat <- c(10, 20, 30)
republican <- c(11, 21, 31)
other <- c(12, 22, 32)

dat1 <- dat %>%
  select(presidential_preference) %>%
  mutate(
    pres_pref_edited =  case_when(
      presidential_preference == -1 ~ NA,
      presidential_preference %in% c(10, 20, 30) ~ "Democratic Vote",
      presidential_preference %in% c(11, 21, 31) ~ "Republican vote",
      presidential_preference %in% c(12, 22, 32) ~ "Other vote"
    )
  )
starwars %>%
  select(name:mass, gender, species) %>%
  mutate(
    type = case_when(
      height > 200 | mass > 200 ~ "large",
      species == "Droid"        ~ "robot",
      TRUE                      ~ "other"
    )
  )