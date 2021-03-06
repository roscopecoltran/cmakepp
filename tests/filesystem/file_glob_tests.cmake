function(test)


  file(WRITE "${test_dir}/file1.txt"      "asd")
  file(WRITE "${test_dir}/file2.txt"      "asd")
  file(WRITE "${test_dir}/file3.txt"      "asd")
  file(WRITE "${test_dir}/dir1/file1.txt" "asd")
  file(WRITE "${test_dir}/dir1/file2.txt" "asd")
  file(WRITE "${test_dir}/dir1/file3.txt" "asd")


  glob("**" --relative --recurse)
  ans(res)
  assert(${res} COUNT 6)
  assert(${res} CONTAINS file1.txt)
  assert(${res} CONTAINS file2.txt)
  assert(${res} CONTAINS file3.txt)
  assert(${res} CONTAINS dir1/file1.txt)
  assert(${res} CONTAINS dir1/file2.txt)
  assert(${res} CONTAINS dir1/file3.txt)
  

  glob("*")
  ans(res)
  assert(${res} COUNT 4)
  
endfunction()