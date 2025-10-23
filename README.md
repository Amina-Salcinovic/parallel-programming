V is number of element is every block structure and every block structure contains 3 arrays(R, G, B).
Function run_aos_aoa_kernel receives the numbr of elements to be processed.
I added this line:  SoA_type *AoSoA = new SoA_type[num_blocks]; to dynamically allocate memory for num_blocks structures.
Then it measures how much time is needed to execute the main part of the loop and receives the number of elements and deletes alocated memory. 


https://docs.google.com/spreadsheets/d/16ZVjujAe7l3iUtvAZVaHef4ncnkFyPVJGTymD0opxLs/edit?gid=0#gid=0

![graph_image](resources/graph.png)

This graph shows the impact of vector block size ('V') on AoSoA data layout performance. We measured how different vector block sizes affect memory performance. 