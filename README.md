# ParallelComputing

Description 

![omp.png](./resources/openacc.png)

The terminal output simply shows that all OpenACC programs were compiled successfully, and the compiler automatically optimized several loops so they can run on the GPU. The messages about “gang” and “vector” are just the compiler telling us that it applied parallelism.

![cuda.png](./resources/cuda.png)

When I entered the cuda folder and ran make, the compiler started building the CUDA version of the StreamTriad program.

This part of the build process uses g++ together with the CUDA libraries. 

Here’s what the output means in simple words:


The terminal includes this part:

-L`which nvcc | sed -e 's!/bin/nvcc!!'`/lib
-L`which nvcc | sed -e 's!/bin/nvcc!!'`/lib64
-lcudart

which means it searches for the folder where CUDA is installed and adds the CUDA lib and lib64 directories, so the program can use NVIDIA’s GPU runtime.

-lcudart links the CUDA runtime library, needed to launch GPU kernels.

There were no errors, which means:

CUDA toolkit (with nvcc) is installed on the lab machine.

The program successfully linked against the CUDA GPU library.

![ocl.png](./resources/ocl.png)

The command: cc -o StreamTriad StreamTriad.o timer.o ezcl_lite.o -lOpenCL

means the compiler is linking all the object files into one final executable called StreamTriad.

The terminal output shows that the OpenCL program linked successfully with the OpenCL library. This means the OpenCL version of StreamTriad is ready to run on any compatible device.

![omp.png](./resources/omp.png)

lto-wrapper: fatal error: could not find accel/nvptx-none/mkoffload

means the Makefile tries to enable OpenMP offloading to an NVIDIA GPU using the flag:

-foffload=nvptx-none

But the GCC installation on this machine does not include the NVPTX offloading tools.

Those tools are needed to generate GPU code for OpenMP.

Without them, GCC cannot build the GPU version, so the linking fails.


------------------------------------------------

![terminal1.png](./resources/terminal1.png)
![terminal2.png](./resources/terminal2.png)


When I connected to the lab's PC I ran the normal version and one parallel version:

./StreamTriad
Average runtime for stream triad loop is 0.022626 secs

./StreamTriad_par1
Average runtime for stream triad loop is 0.022462 secs


These results show that the program ran successfully on the GPU, the runtime is similar between versions because the problem size is small and the server is correctly configured for GPU acceleration.

All programs compile, and the GPU executes the code without any issues.
