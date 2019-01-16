FC=gfortran
LNK=gfortran

OBJS = read_parameters.o main.o  discret_domain.o dimensionless_time.o grid_lengths.o define_D.o save2Dxy.o save2Dyz.o save2Dzx.o
MODS = parameters.o

$(OBJS):	$(MODS)

Tumor3D:	$(OBJS) $(MODS) 
		$(LNK) -o xTumor $(OBJS) $(MODS)

.PHONY: clean

clean:
	-rm -f *.o *.mod xTumor

%.o : %.f90
	$(FC) -c $< -o $@
