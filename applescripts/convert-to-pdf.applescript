on run {inputs, parameters}
  repeat with input in inputs
    set {folder_path, file_name, extension} to get_name_pieces from input
    set the_pdf_path to (folder_path & file_name & ".pdf")
    if extension is ".ppt" or extension is ".pptx" then
      tell application "Keynote" 
        set the_doc to open input
        export the_doc to file the_pdf_path as PDF
        close the_doc
      end tell
    else if extension is ".doc" or extension is ".docx" then
      tell application "Pages" 
        set the_doc to open input
        export the_doc to file the_pdf_path as PDF
        close the_doc
      end tell
    else if extension is ".xls" or extension is ".xlsx" then
      tell application "Numbers" 
        set the_doc to open input
        export the_doc to file the_pdf_path as PDF
        close the_doc
      end tell
    else
      display alert "File format is not supported."
    end if
  end repeat
end run

to get_name_pieces from something
  tell application "System Events" to tell disk item (something as text)
    set the_container to the path of container
    set {the_name, the_extension} to {name, name extension}
  end tell
  if the_extension is not "" then
    set the_name to text 1 thru -((count the_extension) + 2) of the_name
    set the_extension to "." & the_extension
  end if
  return {the_container, the_name, the_extension}
end get_name_pieces