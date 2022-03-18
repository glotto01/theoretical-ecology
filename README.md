# theoretical-ecology
**matlab code for integro-difference equations**<br /><br />
*nextgen* is the function that takes the curent population density curve (vectorized) and generates the subsequent one as defined by the integrodifference equation. It requires the accesory functions *define_k* and *grow*<br /><br />
*grow* defines the growth function, *define_k* vectorizes the dispersal kernal<br /><br />
*size_clip* takes the population vector as an input, returns its spatial extent, and clips the tails that are below the clipping threshold (10^-4)
