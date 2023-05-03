response_matching = simple_matching;
active_buttons = 3;
button_codes = 1,2,3;

#set custom screen data to enable foveal angle font conversion
screen_width = 2240;
screen_height = 1400;
screen_bit_depth = 32;
screen_width_distance = 11.86;
screen_height_distance = 7.42;
screen_distance = 48.3; #inches #tan 7 = 0.12278(w), tan 4 = 0.06992(h); distance from center = 5.935inches(w)/3.71inches(h), font size = 63.63

#defaults
default_font_size = 0.5;
default_text_align = align_left;
default_background_color = 255, 255, 255;

begin;

#target text for conjunction target - both color and letter should match
text {caption = "T"; #green
		font_color = 0,255,0;}conjunction_target;

#target texts for disjunction targets - either the color blue with letter X/T OR letter S with color brown/green
array{
	text {caption = "S"; #brown
			font_color = 150, 75, 0;}disjunction_target_letter_1;
	text {caption = "S"; #green
			font_color = 0, 255, 0;}disjunction_target_letter_2;
	text {caption = "T"; #blue
			font_color = 0, 0, 255;}disjunction_target_color_1;
	text {caption = "X"; #blue
			font_color = 0, 0, 255;}disjunction_target_color_2;
} disjunction_targets;

#distractor texts for both disjunction or conjunction block
array {
	text {caption = "X";
			font_color = 0,255,0;}distractor_color;
	text {caption = "T";
			font_color = 150, 75, 0;}distractor_text;
} distractors;


#trial template
trial{
	trial_duration = forever;
	trial_type = first_response;
	all_responses = false;
	stimulus_event{
		picture{
			background_color = 255, 255, 255;
		} trial_pic;
		response_active = true;
		code="trial";
	}trial_event1;
}trial1;

#fixation_trial shown at the start of every trial/block?
trial{
	trial_duration = 1500;
	stimulus_event{
		picture {
			background_color = 255, 255, 255;
			text {caption = "+"; font_color = 0, 0, 0; font_size = 1; background_color = 255,255,255;};
			x = 0; y = 0;
		}fixation_blank;
		code = "fixation_block_number";
	}fixation_event;
} fixation;


#instruction_trial
trial{
	trial_duration = forever;
	trial_type = correct_response;
	all_responses = false;
	stimulus_event{
		picture{
			background_color = 255, 255, 255;
			text {caption = "Experiment guidelines to follow:\n\n";
					font_color = 0,0,0;
					font_size  = 0.4;};
			x = 0; y = 2.5;
			text {caption ="\tThe goal is to search for the presence of a target.\n\tRespond with J if a target is present or F if not present.\n\tThe possible targets are shown below:";
					font_color = 0,0,0;
					font_size = 0.25;};
			x = 0; y = 1.5;
			text {caption="green letter T or letter S or blue letter";					
			font_color = 0,0,0;
			font_size = 0.25;};
			x = 0; y = 0;
			#text conjunction_target;
			#x = -2; y = 0;
			#text disjunction_target_color_1;
			#x = -1; y = 0;
			#text disjunction_target_color_2;
			#x = 0; y = 0;
			#text disjunction_target_letter_1;
			#x = 1; y = 0;
			#text disjunction_target_letter_2;
			#x = 2; y = 0;
			text {caption = "After every response you will receive feedback\nwhether correct or wrong and time taken to respond.\n\nPress SPACE to start the experiment...";
					font_color = 0,0,0;
					font_size = 0.25;};
			x = 0; y = -2.0;
		};
		target_button = 3;
		code = "Instruction";
	}instruction_event;
}instruction;

#rest_info_trial
trial{
	trial_duration = forever;
	trial_type = correct_response;
	all_responses = false;
	stimulus_event{
		picture{
			background_color = 255, 255, 255;
			text {caption = "Rest\n\n";
					font_color = 0,0,0;
					font_size  = 0.4;};
			x = 0; y = 2.5;
			text {caption ="\tRespond with J if a target is present or F if not present.\n\tThe possible targets are shown below:";
					font_color = 0,0,0;
					font_size = 0.25;};
			x = 0; y = 1.5;
			text {caption="green letter T or letter S or blue letter";					
					font_color = 0,0,0;
					font_size = 0.25;};
			x = 0; y = 0;
			#text conjunction_target;
			#x = -2; y = 0;
			#text disjunction_target_color_1;
			#x = -1; y = 0;
			#text disjunction_target_color_2;
			#x = 0; y = 0;
			#text disjunction_target_letter_1;
			#x = 1; y = 0;
			#text disjunction_target_letter_2;
			#x = 2; y = 0;
			text {caption = "Press SPACE to continue the experiment at your own discretion";
					font_color = 0,0,0;
					font_size = 0.25;};
			x = 0; y = -2.0;
		};
		target_button = 3;
		code = "Rest and instruction";
	}rest_event;
}rest;

#feedback_trial with RT after every trial
trial {
	trial_duration = 1000;
	picture {
		background_color = 255, 255, 255;
		text {caption = " "; font_color = 0,0,0; font_size = 0.5;}feedback_caption;
		x = 0; y = 0;
		};
		code = "feedback";
} feedback;

trial {
	trial_duration = 300000;
	picture {
		background_color = 255, 255, 255;
		text {caption = "Thank you!"; font_color = 0,0,0; font_size = 0.7;};
		x = 0; y = 1;
		text {caption = ""; font_color = 0,255,0; font_size = 0.5;}score_correct;
		x = 0; y = -1;
		text {caption = ""; font_color = 0,0,0; font_size = 0.5;}rt_target;
		x = 0; y = -2;
		text {caption = ""; font_color = 0,0,0; font_size = 0.5;}rt_nontarget;
		x = 0; y = -3;
		};
		code = "score";
} score;


begin_pcl;

#definitions for loops wrt display sizes and trial types with their own set of counters
array <int> display_sizes[4] = {1, 5, 15, 30};
array <int> display_index[4] = {1, 2, 3, 4};
array <int> display_sizes_counter[2][4] = {{0,0,0,0},{0,0,0,0}}; 	#1st row - is for -ve trials, 2nd row - is for +ve trials
array <int> trial_types[2] = {1, 2}; 										#1 - is for -ve trials, 2 is for +ve trials
array <int> trial_types_counter[2] = {0,0};
array <int> block_order[6] = {1, 2, 2, 1, 1, 2}; 						#1 - is for disjunction targets, 2 is for conjunction targets

#disjunction_target indexes and counter
array <int> disjunction_targets_index[4] = {1,2,3,4};
array <int> disjunction_targets_counter[4] = {0,0,0,0};

#distractor index and counter
array <int> distractor_index[2] = {1,2};
array <int> distractor_counter[2] = {0,0};

#event_code text arrays
array <string> trial_text[2] = {"negative_trial", "positive_trial"};
array <string> target_text[2] = {"disjunction_target", "conjunction_target"};
array <string> disjunction_target_text[4] = {"S_brown","S_green","blue_T","blue_X"};

#display is in the range of 14degrees x 8degrees
array <double> xy_coordinates[88][2] = {{0.787,0.393},
													 {0.787,1.574},
													 {1.25,0.944},
													 {1.968,1.102},
													 {2.362,0.472},
													 {3.228,0.59},
													 {3.149,1.338},
													 {3.858,0.905},
													 {2.362,1.968},
													 {1.456,2.165},
													 {0.748,2.755},
													 {5.59,0.748},
													 {4.33,1.85},
													 {3.149,2.32},
													 {3.897,2.91},
													 {2.637,3.307},
													 {1.06,3.385},
													 {5.314,1.653},
													 {5.787,2.637},
													 {4.72,3.42},
													 {6.299,3.149},
													 {6.299,1.65},
													 #2nd quadrant
													 {-0.787,0.393},
													 {-0.787,1.574},
													 {-1.25,0.944},
													 {-1.968,1.102},
													 {-2.362,0.472},
													 {-3.228,0.59},
													 {-3.149,1.338},
													 {-3.858,0.905},
													 {-2.362,1.968},
													 {-1.456,2.165},
													 {-0.748,2.755},
													 {-5.59,0.748},
													 {-4.33,1.85},
													 {-3.149,2.32},
													 {-3.897,2.91},
													 {-2.637,3.307},
													 {-1.06,3.385},
													 {-5.314,1.653},
													 {-5.787,2.637},
													 {-4.72,3.42},
													 {-6.299,3.149},
													 {-6.299,1.65},
													 #3rd quadrant
													 {-0.787,-0.393},
													 {-0.787,-1.574},
													 {-1.25,-0.944},
													 {-1.968,-1.102},
													 {-2.362,-0.472},
													 {-3.228,-0.59},
													 {-3.149,-1.338},
													 {-3.858,-0.905},
													 {-2.362,-1.968},
													 {-1.456,-2.165},
													 {-0.748,-2.755},
													 {-5.59,-0.748},
													 {-4.33,-1.85},
													 {-3.149,-2.32},
													 {-3.897,-2.91},
													 {-2.637,-3.307},
													 {-1.06,-3.385},
													 {-5.314,-1.653},
													 {-5.787,-2.637},
													 {-4.72,-3.42},
													 {-6.299,-3.149},
													 {-6.299,-1.65},
													 #4th quadrant
													 {0.787,-0.393},
													 {0.787,-1.574},
													 {1.25,-0.944},
													 {1.968,-1.102},
													 {2.362,-0.472},
													 {3.228,-0.59},
													 {3.149,-1.338},
													 {3.858,-0.905},
													 {2.362,-1.968},
													 {1.456,-2.165},
													 {0.748,-2.755},
													 {5.59,-0.748},
													 {4.33,-1.85},
													 {3.149,-2.32},
													 {3.897,-2.91},
													 {2.637,-3.307},
													 {1.06,-3.385},
													 {5.314,-1.653},
													 {5.787,-2.637},
													 {4.72,-3.42},
													 {6.299,-3.149},
													 {6.299,-1.65}
};


int block_order_count = block_order.count();
int display_sizes_count = display_sizes_counter.count();
int trial_types_count = trial_types_counter.count();
int disjunction_target_count = disjunction_targets_counter.count();

int trial_count = 128;																			#total number of trials
int trial_count_max_per_type = trial_count/2;													#half are +ve trials and half are -ve trials
int display_count_max_per_type = trial_count_max_per_type/display_sizes.count();		#each display size type is equally presented for both +ve and -ve trials so 

int disjunction_target_max_count = trial_count_max_per_type/disjunction_targets_index.count();

int total_correct = 0;
int total_incorrect = 0;
int total_misses = 0;
int total_trials = 0;
int total_target = 0;
int total_nontarget = 0;

double average_correct = 0;
double average_incorrect = 0;
double average_target = 0;
double average_nontarget = 0;

#loop over blocks
loop int h = 1 until h > block_order_count begin
	#if first block then present instruction else rest and info
	if h == 1 then
		instruction_event.set_event_code("instruction_block_number:"+string(h)+" "+"Block_type:"+target_text[block_order[h]]);
		instruction.present()
	else
		rest_event.set_event_code("rest_block_number:"+string(h)+" "+"Block_type:"+target_text[block_order[h]]);
		rest_event.set_target_button(3);
		rest.present();
	end;
	#reset counters on start of every block
	loop int i = 1 until i > display_sizes_count begin
		loop int j = 1 until j > display_sizes_counter[i].count() begin
			display_sizes_counter[i][j] = 0;
			j = j + 1;
		end;
		i = i + 1;
	end;
	loop int i = 1 until i > trial_types_count begin
		trial_types_counter[i] = 0;
		i = i + 1;
	end;
	loop int i = 1 until i > disjunction_target_count begin
		disjunction_targets_counter[i] = 0;
		i = i + 1;
	end;
	term.print("\n");
	#loop over number of trials
	loop int l = 1 until l > trial_count begin
		#present fixation trial
		fixation_event.set_event_code("Fixation_count:"+string(l));
		fixation.present();
		#clear the trial picture from previous trial
		trial_pic.clear();
		xy_coordinates.shuffle();
		trial_types.shuffle();
		display_index.shuffle();
		#ensure that +ve and -ve trial can occur exactly half the times of total trials
		loop until trial_types_counter[trial_types[1]] > trial_count_max_per_type begin
			trial_types.shuffle();
			if trial_types_counter[trial_types[1]] < trial_count_max_per_type then
				trial_types_counter[trial_types[1]] = trial_types_counter[trial_types[1]] + 1;
				break;
			end;
		end;
		#ensure that each display size is displayed equal number of times
		loop until display_sizes_counter[trial_types[1]][display_index[1]] > display_count_max_per_type begin
			display_index.shuffle();
			if display_sizes_counter[trial_types[1]][display_index[1]] < display_count_max_per_type then
				display_sizes_counter[trial_types[1]][display_index[1]] = display_sizes_counter[trial_types[1]][display_index[1]] + 1;
				break;
			end;
		end;
		int target_add_flag = 0;
		string target = "";
		#distractor counter to ensure both types of distractors are equally abundant
		int distractor_max_count = display_sizes[display_index[1]]/2;
		loop int i = 1 until i > distractor_counter.count() begin
			distractor_counter[i] = 0;
			i = i + 1;
		end;
		int target_flag = 0;
		loop int m = 1 until m > display_sizes[display_index[1]] begin
			if target_add_flag == 0 then
				if trial_types[1] == 2 then				#+ve trial
						target_flag = 1;
						trial_event1.set_target_button(1);
						if block_order[h] == 1 then		#disjuntion_target 
							loop until disjunction_targets_counter[disjunction_targets_index[1]] > disjunction_target_max_count begin
								disjunction_targets_index.shuffle();
								if disjunction_targets_counter[disjunction_targets_index[1]] < disjunction_target_max_count then
									disjunction_targets_counter[disjunction_targets_index[1]] = disjunction_targets_counter[disjunction_targets_index[1]] + 1;
									break;
								end;
							end;
							trial_pic.add_part(disjunction_targets[disjunction_targets_index[1]], xy_coordinates[m][1], xy_coordinates[m][2]);
							target = disjunction_target_text[disjunction_targets_index[1]];
						else										#conjunction_target
							trial_pic.add_part(conjunction_target, xy_coordinates[m][1], xy_coordinates[m][2]);
						end;
					target_add_flag = 1;
				else												#-ve trial
					target_add_flag = 1;						#set target add flag to avoid entering the first flag check for -ve trials with no target
					trial_event1.set_target_button(2);
					distractor_index.shuffle();
					distractor_counter[distractor_index[1]] = distractor_counter[distractor_index[1]] + 1;
					trial_pic.add_part(distractors[distractor_index[1]],xy_coordinates[m][1], xy_coordinates[m][2]);
				end;
			else
				#add remainging distractors such that both of them are equally abundant
				distractor_index.shuffle();
				int distractor = distractor_index[1];
				if distractor_counter[distractor_index[1]] >= distractor_max_count then
					distractor = distractor_index[2];
				end;
				trial_pic.add_part(distractors[distractor],xy_coordinates[m][1], xy_coordinates[m][2]);
				distractor_counter[distractor] = distractor_counter[distractor] + 1;
			end;
			m = m + 1;
		end;
		trial_event1.set_event_code(target_text[block_order[h]] + " " + trial_text[trial_types[1]]+" "+"display_size_count:"+string(display_sizes[display_index[1]])+"_"+string(display_sizes_counter[trial_types[1]][display_index[1]])+" "+"Target:"+target);
		trial1.present();
		#obtain last response and set feedback if correct/incorrect with reaction time
		stimulus_data last = stimulus_manager.last_stimulus_data();
		double reaction_time = last.reaction_time();
		if target_flag == 1 then
			average_target = average_target + reaction_time;
			total_target = total_target + 1;
		else
			average_nontarget = average_nontarget + reaction_time;
			total_nontarget = total_nontarget + 1;
		end;
		if last.type() == stimulus_hit then
			average_correct = average_correct + reaction_time;
			feedback_caption.set_caption("Correct" + "\nRT: " + string(reaction_time)+"ms");
			feedback_caption.redraw();
			feedback.present();
			total_correct = total_correct + 1;
		elseif last.type() == stimulus_incorrect then
			average_incorrect = average_incorrect + reaction_time;
			feedback_caption.set_caption("Incorrect" + "\nRT: " + string(reaction_time)+"ms");
			feedback_caption.redraw();
			feedback.present();
			total_incorrect = total_incorrect + 1;
		else
			total_misses = total_misses + 1;
		end;
		total_trials = total_trials + 1;
		l = l + 1;
	end;
	h = h + 1;
end;
if (total_incorrect+total_correct) == 0 then
	score_correct.set_caption("Correct trials: "+string(100*total_correct/(total_trials))+"%");
	score_correct.redraw();
else
	score_correct.set_caption("Correct trials: "+string(100*total_correct/(total_incorrect+total_correct))+"%");
	score_correct.redraw();
end;
rt_target.set_caption("Target avg RT: "+string(int(average_target/total_target))+"ms");
rt_target.redraw();
rt_nontarget.set_caption("No Target avg RT: "+string(int(average_nontarget/total_nontarget))+"ms");
rt_nontarget.redraw();
score.present();