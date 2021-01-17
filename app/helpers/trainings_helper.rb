module TrainingsHelper

    def display_index_header
        # 2021-01-16 02 moved the training sessions workout name, race title from the app/views/trainings/index.html.erb
        if @workout
            content_tag(:h2,"Training Sessions for the  #{@workout.name} workout")
        elsif @race
            tag.h2("Training Sessions for the #{@race.title} race")
        else
            content_tag(:h1, "All Training Sessions")
        end
    end

    def display_date(t) # 2021-01-17 moved here from app/views/trainings/index.html.erb
        "on #{t.datetime}" if t.date
    end
    
    def display_feeling(t) # 2021-01-17 moved here from app/views/trainings/index.html.erb
        "and felt: #{t.feeling}"  if !t.feeling.empty?
    end

    def workout_form_option(form_builder) # 2021-01-17 moved here from app/views/trainings/new.html.erb
         if @workout  #  2021-01-15
            content_tag(:p, "Workout: #{@workout.name}")
             else 
                #    2021-01-17 moved the "select a workout" and "create a workout" to app/views/trainings/_workoutform.html.erb
                render partial: "workoutform", locals: {f: form_builder} 
                #   2021-01-17 added a render partial
               end 
    end
    
end
