package com.portfolio_v1.api_v1.utility;

import org.apache.ibatis.type.MappedTypes;
import org.springframework.stereotype.Component;

import java.util.UUID;

@MappedTypes(UUID.class)
@Component
public class UUIDTypeHandler {

}
