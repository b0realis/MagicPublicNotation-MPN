extends SceneTree
## The move list's acceptance test (mpn-move-list.md §9, the implementation
## guide's "Acceptance" 1): each example record with a .txt beside it must
## render to that .txt byte for byte. Prints one line per example and exits
## 0 when every one matches, 1 otherwise.
##
##   godot --headless --path reference --import
##   godot --headless --path reference -s check_examples.gd


func _initialize() -> void:
	var examples := ProjectSettings.globalize_path("res://").path_join("../mpn-examples").simplify_path()
	var failed := 0
	var checked := 0
	for name in DirAccess.get_files_at(examples):
		if not name.ends_with(".mpn"):
			continue
		var expected_path := examples.path_join(name.get_basename() + ".txt")
		var document := MpnCodec.parse(FileAccess.get_file_as_string(examples.path_join(name)))
		if String(document.get("error", "")) != "":
			print("FAIL %s: not a valid record (%s)" % [name, document["error"]])
			failed += 1
			continue
		if not FileAccess.file_exists(expected_path):
			print("ok   %s: a valid record (no move list to compare)" % name)
			continue
		checked += 1
		var got := MpnMoveList.text(document)
		var want := FileAccess.get_file_as_string(expected_path)
		if got == want:
			print("ok   %s: the move list matches %s byte for byte" % [name, expected_path.get_file()])
		else:
			failed += 1
			print("FAIL %s: the move list differs from %s" % [name, expected_path.get_file()])
	print("%d move list(s) compared, %d failure(s)" % [checked, failed])
	quit(1 if failed > 0 or checked == 0 else 0)
