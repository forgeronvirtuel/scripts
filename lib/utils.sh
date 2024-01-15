find_in_path() {
  local target_path="$1"

  # Split the $PATH variable into an array using ':' as the delimiter
  IFS=":" read -ra path_dirs <<< "$PATH"

  # Flag to indicate if the path exists in $PATH
  local path_found=false

  # Iterate through each directory in $PATH
  for dir in "${path_dirs[@]}"; do
    # Check if the target path exists in the current directory
    if [ -d "$dir/$target_path" ]; then
      path_found=true
      break  # Exit the loop if found
    fi
  done

  # Check the result and store it in a variable
  if [ "$path_found" = true ]; then
    result=false
  else
    result=true
  fi

  # Return the result
  echo "$result"
}

