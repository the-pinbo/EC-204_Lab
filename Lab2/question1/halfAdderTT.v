primitive carry (cy,a,b,c)
  input a,b,c;
  output cy;
  table
    // a b c  cy
      1 1 ? : 1;
      1 ? 1 : 1;
      ? 1 1 : 1;
      0 0 ? : 0;
      0 ? 0 : 0;
      ? 0 0 : 0;
  endtable
endprimitive