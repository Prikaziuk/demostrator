function tab = read_filenames_sheet(input_path, sheetname)
    
    if nargin == 2
        if verLessThan('matlab', '9.8')
            tab = readtable(input_path, 'sheet', sheetname);
        else
            tab = readtable(input_path, 'sheet', sheetname, 'Format', 'auto');
        end
    else  % for MS opponents
        tab = readtable(input_path);
    end

    expected_cols = {'variable', 'value', 'units', 'description'};
    colnames = tab.Properties.VariableNames;
    assert(all(ismember(expected_cols, colnames)), ...
           ['wrong column names in input data table; expected: ' sprintf('%s, ', expected_cols{:})])

end