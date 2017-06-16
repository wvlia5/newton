MAIN_DIR=.
DEP_DIR=$(MAIN_DIR)/inc
SRC_DIR=$(MAIN_DIR)/src
OBJ_DIR=$(MAIN_DIR)/obj
BIN_DIR=$(MAIN_DIR)/bin
OBJELEM = $(OBJ_DIR)/Client.o						\
		  $(OBJ_DIR)/Communicator.o	        \
		  $(OBJ_DIR)/Evolution.o	         	\
		  $(OBJ_DIR)/global.o		  					\
		  $(OBJ_DIR)/main.o 		  					\
		  $(OBJ_DIR)/Mapper.o 							\
		  $(OBJ_DIR)/MathLib.o 							\
		  $(OBJ_DIR)/Newton.o 							\
		  $(OBJ_DIR)/Parser.o 							\
		  $(OBJ_DIR)/pow2fpow.o							\
		  $(OBJ_DIR)/System.o 							\
		  $(OBJ_DIR)/Solver.o							  \
		  $(OBJ_DIR)/testClient.o						\
		  $(OBJ_DIR)/th2xs.o								\
		  $(OBJ_DIR)/relapPow2th.o					\
		  $(OBJ_DIR)/fermiXs2pow.o					\
		  $(OBJ_DIR)/userClient.o
EXE=$(BIN_DIR)/Newton
MPICC=mpic++

#~ all: $(BIN_DIR) $(OBJ_DIR) $(OBJELEM)
#~ 	$(MPICC) $(OBJELEM) -o $(EXE)

all: $(BIN_DIR) $(OBJ_DIR) $(OBJELEM)
	$(FC) $(OBJELEM) \
	$(FFLAGS) -o $(EXE) \
	$(PETSC_FORTRAN_LIB) $(PETSC_LIB) ${SLEPC_SYS_LIB} -lz

clean_:
	$(RM) $(OBJELEM) $(OBJELEM2) $(EXE)

${OBJ_DIR}/%.o: ${SRC_DIR}/%.cpp
	${PETSC_COMPILE} -c ${CFLAGS} -o $@ $< -I${DEP_DIR}
	
#~ $(MPICC) -c -o $@ $< -I${DEP_DIR}

include ${PETSC_DIR}/lib/petsc/conf/variables
include $(PETSC_DIR)/lib/petsc/conf/rules
