extends Node2D

var main_dic={dic_one = {name="a",
score=30
},
 dic_two = {name="Construct",
score=3
},
dic_three = {name="unity",
score=6
},
dic_four = {name="godot",
score=10
}
	
}
var name_matched=false
var score=0
var title="a"
var arr =[main_dic.dic_one,main_dic.dic_two,main_dic.dic_three,main_dic.dic_four]
# Called when the node enters the scene tree for the first time.
func _ready():
	_leader_board_sorting()
	pass

func _process(delta):
	$score_recent.text=str(score)
	$score.text= str(arr[1].score)
	$score2.text=str(arr[2].score)
	$score3.text=str(arr[3].score)
	$name.text= str(arr[1].name)
	$name2.text = str(arr[2].name)
	$name3.text = str(arr[3].name)
	$name_recent.text=str(title)
func _on_Button_pressed():
	score+=1


func _on_save_pressed():
	_leader_board_sorting()
				
func _leader_board_sorting():
	_name_matched()
	
#if no name is same when sorting
func _no_name_matched_sorting():
	arr[0].name=title
	arr[0].score=score
	var new_name
	var new_score
	var k = arr.size()-1
	for i in range(arr.size()):
		if i<arr.size():
			if k >0:
				if arr[0].score>arr[k].score:
					new_name=arr[0].name
					new_score=arr[0].score
					arr[0].score=arr[k].score
					arr[0].name= arr[k].name
					arr[k].score=new_score
					arr[k].name = new_name
				print(arr[0])
			k=k-1
#if name matched it will only sort if the previous score will be less than the new score of the same name
func _name_matched():
	name_matched=false
	arr[0].name=title
	arr[0].score=score
	var new_name
	var new_score
	var k = arr.size()-1
	var j=k-1
	for i in range(arr.size()):
		if i<arr.size():
			if k >0:
				if arr[0].name==arr[k].name and arr[0].score>arr[k].score:
					arr[k].name=arr[0].name
					arr[k].score=arr[0].score
					name_matched=true
				elif  arr[0].name==arr[k].name and arr[0].score<=arr[k].score:
					name_matched=true
				print(arr[0])
			k=k-1
	print(name_matched)
	if !name_matched:
		_no_name_matched_sorting()
	else:
		_name_matched_sorting()
func _name_matched_sorting():
	arr[0].name="title"
	arr[0].score=0
	var new_name
	var new_score
	for j in range(arr.size()):
		if j<arr.size()-1:
			if arr[j].score>=arr[j+1].score:
				new_name=arr[j].name
				new_score=arr[j].score
				arr[j].score=arr[j+1].score
				arr[j].name= arr[j+1].name
				arr[j+1].score=new_score
				arr[j+1].name = new_name


func _on_Button2_pressed():
	title=str($set_name.text)
