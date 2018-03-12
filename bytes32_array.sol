pragma solidity ^0.4.18;

/// @notice TODO: Address and bytes32. refactor the duplicate code.
///               The elements of set is different each other.
library Bytes32Array {

    /// @dev Delete the value of the bytes32 array
    function bytes32Delete(bytes32 _value, bytes32[] storage _array)
        internal
        returns (bool)
    {
        var index = bytes32Index(_value,  _array);
        // Not found
        if (index >= _array.length)
            return false;

        // Remove the gap
        for (uint i = index; i < _array.length - 1; i++) {
            _array[i] = _array[i + 1];
        }

        // Also delete the last element
        delete _array[_array.length - 1];
        _array.length--;
        return true;
    }

    /// @dev Get the index of the value in the bytes32 array
    /// @return The index. If i == length, means not find
    function bytes32Index(bytes32 _value, bytes32[] _array)
        pure
        internal
        returns (uint i)
    {
        // Find the index of the value in the array
        for (i = 0; i < _array.length; i++) {
            if (_value == _array[i])
                return i;
        }
    }

    /// @dev Delete the value of the address array
    function addressDelete(address _value, address[] storage _array)
        internal
        returns (bool)
    {
        var index = addressIndex(_value,  _array);
        // Not found
        if (index >= _array.length)
            return false;

        // Remove the gap
        for (uint i = index; i < _array.length - 1; i++) {
            _array[i] = _array[i + 1];
        }

        // Also delete the last element
        delete _array[_array.length - 1];
        _array.length--;
        return true;
    }

    /// @dev Check if the value in the array of bytes32
    function bytes32InArray(bytes32 _value, bytes32[] _array)
        pure
        internal
        returns (bool)
    {
        // Have found the value in array
        for (uint i = 0; i < _array.length; i++) {
            if (_value == _array[i])
                return true;
        }
        // Not in
        return false;
    }

    /// @dev Check if the values in the array of bytes32
    /// @notice TODO: Check SubSet
    function bytes32SubSet(bytes32[] _subSet, bytes32[] _array)
        pure
        internal
        returns (bool)
    {
        for (uint i = 0; i < _subSet.length; i++) {
            if (bytes32InArray(_subSet[i], _array))
                continue;
            else
                return false;
        }

        return true;
    }


    /// @dev Replace the value in the array of bytes32
    function bytes32Replace(bytes32 _old, bytes32 _new, bytes32[] storage _array)
        internal
        returns(bool)
    {
        // Find the value in array and repalce it
        for (uint i = 0; i < _array.length; i++) {
            if (_old == _array[i]) {
                _array[i] = _new;
                return true;
            }
        }
    }

    /// @dev Check the array of bytes32 is nul
    function bytes32ArrayNul(bytes32[] _array)
        pure
        internal
        returns (bool)
    {
        if (_array.length == 0)
            return true;
        for (uint i = 0; i < _array.length; i++) {
            if (bytes32(0x0) != _array[i])
                return false;
        }

        return true;
    }
}
