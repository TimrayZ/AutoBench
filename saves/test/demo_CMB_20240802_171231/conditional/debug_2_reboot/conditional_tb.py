def find_minimum(a, b, c, d):
    """
    Compute the minimum of four 8-bit unsigned integers.
    
    Parameters:
    - a (int): The first input integer.
    - b (int): The second input integer.
    - c (int): The third input integer.
    - d (int): The fourth input integer.
    
    Returns:
    - int: The minimum value among the input integers.
    """
    return min(a, b, c, d)

def check_dut(test_vectors: list) -> list:
    """
    Checks the correctness of the DUT based on the provided test vectors.
    
    Parameters:
    - test_vectors (list): A list of dictionaries containing test scenarios.
    
    Returns:
    - List: The indices of the failed test scenarios.
    """
    failed_indices = []

    for index, test_scenario in enumerate(test_vectors):
        # Extract values from the test scenario
        a = test_scenario['a']
        b = test_scenario['b']
        c = test_scenario['c']
        d = test_scenario['d']
        expected_min = test_scenario['min']
        
        # Compute the minimum using the helper function
        computed_min = find_minimum(a, b, c, d)
        
        # Check if the computed minimum matches the expected minimum
        if computed_min != expected_min:
            failed_indices.append(index)  # Add the index of the failed scenario to the list

    return failed_indices

def SignalTxt_to_dictlist(txt:str):
    lines = txt.strip().split("\n")
    signals = []
    for line in lines:
        signal = {}
        line = line.strip().split(", ")
        for item in line:
            if "scenario" in item:
                item = item.split(": ")
                signal["scenario"] = item[1]
            else:
                item = item.split(" = ")
                key = item[0]
                value = item[1]
                if "x" not in value and "z" not in value:
                    signal[key] = int(value)
                else:
                    signal[key] = value 
        signals.append(signal)
    return signals
with open("TBout.txt", "r") as f:
    txt = f.read()
vectors_in = SignalTxt_to_dictlist(txt)
tb_pass = check_dut(vectors_in)
print(tb_pass)
