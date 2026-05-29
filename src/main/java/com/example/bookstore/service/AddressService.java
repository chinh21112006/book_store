package com.example.bookstore.service;

import com.example.bookstore.model.Address;
import com.example.bookstore.model.User;
import com.example.bookstore.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class AddressService {

    @Autowired
    private AddressRepository addressRepository;

    public List<Address> getAddressesByUser(User user) {
        return addressRepository.findByUser(user);
    }

    public Optional<Address> getAddressByIdAndUser(Long addressId, User user) {
        return addressRepository.findByIdAndUser(addressId, user);
    }

    @Transactional
    public Address saveAddress(Address address) {
        // If this address is set as default, ensure all other addresses for the user are not default
        if (address.getIsDefault()) { // Changed from isDefault() to getIsDefault()
            List<Address> userAddresses = addressRepository.findByUser(address.getUser());
            userAddresses.forEach(addr -> {
                if (!addr.getId().equals(address.getId()) && addr.getIsDefault()) { // Changed from isDefault() to getIsDefault()
                    addr.setIsDefault(false); // Changed from setDefault() to setIsDefault()
                    addressRepository.save(addr);
                }
            });
        }
        return addressRepository.save(address);
    }

    @Transactional
    public void deleteAddress(Long addressId, User user) {
        addressRepository.findByIdAndUser(addressId, user).ifPresent(addressRepository::delete);
    }

    @Transactional
    public void setDefaultAddress(Long addressId, User user) {
        List<Address> userAddresses = addressRepository.findByUser(user);
        userAddresses.forEach(addr -> {
            if (addr.getId().equals(addressId)) {
                addr.setIsDefault(true); // Changed from setDefault() to setIsDefault()
            } else {
                addr.setIsDefault(false); // Changed from setDefault() to setIsDefault()
            }
            addressRepository.save(addr);
        });
    }

    public Optional<Address> getDefaultAddressByUser(User user) {
        List<Address> defaultAddresses = addressRepository.findByUserAndIsDefaultTrue(user);
        return defaultAddresses.stream().findFirst(); // Should only be one default address
    }
}
