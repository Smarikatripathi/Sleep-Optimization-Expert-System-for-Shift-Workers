% Work Schedule Advice
work_advice(night_shift) :- 
    write('Maintain consistent sleep hours, even on non-working days.'), nl,
    write('Wear blue light-blocking glasses before bed.'), nl.

work_advice(rotating_shifts) :- 
    write('Gradually shift your sleep schedule when transitioning shifts.'), nl,
    write('Take short naps before night shifts for better alertness.'), nl.

% Age-based advice
age_advice(Age) :-
    (Age < 30 ->
        write('Young adults should ensure at least 7-9 hours of sleep per night.'), nl;
    Age >= 30, Age < 50 ->
        write('Aim for at least 7 hours of sleep per night for optimal health.'), nl;
    Age >= 50 ->
        write('Older adults might need less sleep, but consistency is key for better rest.'), nl
    ).

% Sleep Quality Improvement Tips
sleep_quality_advice(Score) :-
    (Score < 6 -> 
        write('Consider relaxation techniques like meditation before sleep.'), nl,
        write('Limit caffeine intake 4-6 hours before bedtime.'), nl;
    Score >= 6, Score =< 8 ->
        write('You are getting good quality sleep. Keep following healthy habits!'), nl;
    Score > 8 ->
        write('Great sleep quality! Keep it up with consistent schedules and healthy lifestyle.'), nl
    ).

% Light Exposure Advice
light_exposure_advice(no) :- 
    write('Use a light therapy box during waking hours and get sunlight exposure in the morning.'), nl.
light_exposure_advice(yes) :- 
    write('Great! Natural light exposure helps regulate circadian rhythm.'), nl.

% Exercise Frequency Advice
exercise_advice(never) :- 
    write('Incorporate light exercise into your routine, like walking or stretching.'), nl.
exercise_advice(daily) :- 
    write('Daily exercise is great! Ensure it is done at least 2-3 hours before bedtime.'), nl.
exercise_advice(occasionally) :- 
    write('Exercise occasionally, but aim for consistency to improve sleep quality.'), nl.

% Sleep Environment Advice
sleep_environment_advice(no) :- 
    write('Use blackout curtains or an eye mask to block light. Consider a white noise machine to block out sound.'), nl.
sleep_environment_advice(yes) :- 
    write('Your sleep environment is ideal for rest. Keep it quiet, dark, and cool.'), nl.

% Collecting User Feedback and Adjusting Recommendations
store_feedback(User, Score) :- 
    assert(user_feedback(User, Score)).

% Learning-based advice adjustment
adjust_advice(User) :-
    user_feedback(User, Score),
    (Score < 6 -> 
        write('We noticed your sleep quality has been low, would you like to adjust your routines?'), nl;
    Score >= 6 -> 
        write('Your sleep is improving! Keep up with your habits for better rest.'), nl
    ).

% Main system function
start :-
    write('Welcome to Sleep Optimization Expert System for Shift Workers: The Sleep Optimization Expert System for Shift Workers!'), nl,

    % Collect basic information
    write('Enter your work schedule (e.g., night_shift, rotating_shifts): '), 
    read(WorkSchedule),
    work_advice(WorkSchedule), nl,

    write('How old are you? '), 
    read(Age),
    age_advice(Age), nl,

    write('Rate your sleep quality on a scale of 1 to 10: '), 
    read(SleepQuality),
    sleep_quality_advice(SleepQuality), nl,
    store_feedback(user1, SleepQuality), % Store feedback for future reference

    write('Do you get sunlight exposure? (yes/no): '), 
    read(LightExposure),
    light_exposure_advice(LightExposure), nl,

    write('How often do you exercise weekly? (e.g., never, daily, occasionally): '), 
    read(ExerciseFrequency),
    exercise_advice(ExerciseFrequency), nl,

    write('Is your sleep environment quiet and dark? (yes/no): '), 
    read(SleepEnvironment),
    sleep_environment_advice(SleepEnvironment), nl,

    % Ask user if they want advice based on their feedback
    adjust_advice(user1),

    write('Thank you for using Sleep Optimization Expert System for Shift Workers! We hope these tips help you optimize your sleep.'), nl.

