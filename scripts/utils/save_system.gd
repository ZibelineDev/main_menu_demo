class_name SaveSystem

const DIR_PATH : String = "user://saves"

static func create_new_profile() -> Data:
	var save_files : PackedStringArray = get_save_files()
	var counter : int = 1
	
	var found_available_count : bool = false
	
	while found_available_count == false:
		var file_name : String = "save_%s.tres" %counter
		var no_match : bool = true
		
		for file : String in save_files:
			if file_name == file:
				no_match = false
		
		if no_match:
			found_available_count = true
		else:
			counter += 1
	
	var save_path : String = "%s/save_%s.tres" %[DIR_PATH, counter]
	var new_data : Data = Data.new(
		"Profile %s" %counter,
		save_path
	)
	
	ResourceSaver.save(new_data, save_path)
	return new_data


static func open_save_dir() -> DirAccess:
	if not DirAccess.dir_exists_absolute(DIR_PATH):
		DirAccess.make_dir_absolute(DIR_PATH)
	
	return DirAccess.open(DIR_PATH)


static func get_save_files() -> PackedStringArray:
	var dir : DirAccess = open_save_dir()
	
	var files : PackedStringArray = dir.get_files()
	
	if files.size() == 0:
		return files
	
	var filtered_files : PackedStringArray = []
	
	for file : String in files:
		if file.ends_with(".tres") or file.ends_with(".res"):
			filtered_files.append(file)
	
	return filtered_files


static func get_profiles_data() -> Array[Data]:
	var save_files : PackedStringArray = get_save_files()
	
	var profiles_data : Array[Data] = []
	
	for save_file : String in save_files:
		var new_data : Data = Data.new()
		new_data = load("%s/%s" %[DIR_PATH, save_file]) as Data
		
		profiles_data.append(new_data)
	
	return profiles_data


static func get_profile_data(save_path : String) -> Data:
	var data : Data = Data.new()
	data = load("%s/%s" %[DIR_PATH, save_path]) as Data
	
	return data
