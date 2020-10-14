// object_destructor.js

function ezObjectDestructor(oO) { var rV = -1; try { rV = oO.destructor(); } catch(e) { rV = null; } finally { rV = null; }; return rV; }

